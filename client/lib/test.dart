import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_payment_plus/flutter_paystack_payment_plus.dart';
import 'package:http/http.dart' as http;

const String appName = 'Paystack Example';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _verticalSizeBox = const SizedBox(height: 20.0);
  final plugin = PaystackPayment();

  int _radioValue = 0;
  bool _inProgress = false;
  String? _cardNumber;
  String? _cvv;
  int? _expiryMonth;
  int? _expiryYear;

  bool check = false;

  @override
  void initState() {
    plugin.initialize(
        publicKey: "pk_test_434d6c92b09c9e96a08075df10b4717fd38f9f3e");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(appName)),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Expanded(
                      child: Text('Initalize transaction from:'),
                    ),
                    Expanded(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            RadioListTile<int>(
                              value: 0,
                              groupValue: _radioValue,
                              onChanged: _handleRadioValueChanged,
                              title: const Text('Local'),
                            ),
                          ]),
                    )
                  ],
                ),
                _verticalSizeBox,
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColorLight: Colors.white,
                    primaryColorDark: navyBlue,
                    textTheme: Theme.of(context).textTheme.copyWith(
                          bodyMedium: const TextStyle(
                            color: lightBlue,
                          ),
                        ),
                    colorScheme:
                        ColorScheme.fromSwatch().copyWith(secondary: green),
                  ),
                  child: Builder(
                    builder: (context) {
                      return _inProgress
                          ? Container(
                              alignment: Alignment.center,
                              height: 50.0,
                              child: kIsWeb
                                  ? const CircularProgressIndicator()
                                  : Platform.isIOS
                                      ? const CupertinoActivityIndicator()
                                      : const CircularProgressIndicator(),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _getPlatformButton(
                                    'Charge Card', () => _startAfreshCharge()),
                                _verticalSizeBox,
                                const SizedBox(
                                  height: 40.0,
                                ),
                              ],
                            );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleRadioValueChanged(int? value) {
    if (value != null) setState(() => _radioValue = value);
  }

  _startAfreshCharge() async {
    _formKey.currentState?.save();

    Charge charge = Charge();
    charge.card = _getCardFromUI();

    setState(() => _inProgress = true);
    charge
      ..amount = 2500 * 100 // In base currency
      ..email = 'officialrrye5@gmail.com'
      ..reference = _getReference()
      ..putCustomField('Charged From', 'Flutter SDK');
    _chargeCard(charge);
  }

  _chargeCard(Charge charge) async {
    final response = await plugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      _verifyOnServer(reference);
      return;
    }

    // The transaction failed. Checking if we should verify the transaction
    if (response.verify) {
      _verifyOnServer(reference);
    } else {
      setState(() => _inProgress = false);
      _updateStatus(reference, response.message);
    }
  }

  String _getReference() {
    String platform;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        platform = 'iOS';
      } else {
        platform = 'Android';
      }
    } else {
      platform = "WEB";
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  Widget _getPlatformButton(String string, Function() function) {
    // is still in progress
    Widget widget;
    if (!kIsWeb) {
      if (Platform.isIOS) {
        widget = CupertinoButton(
          onPressed: function,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          color: CupertinoColors.activeBlue,
          child: Text(
            string,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
        return widget;
      } else {
        widget = ElevatedButton(
          onPressed: function,
          child: Text(
            string.toUpperCase(),
            style: const TextStyle(fontSize: 17.0),
          ),
        );
        return widget;
      }
    } else {
      widget = ElevatedButton(
        onPressed: function,
        child: Text(
          string.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
      return widget;
    }
  }

  void _verifyOnServer(String? reference) async {
    var head = {
      "Authorization": "Bearer sk_test_c22aa25cfa47b5108e164e4c4a89d30b03070dbc"
    };
    _updateStatus(reference, 'Verifying...');
    String url = 'https://api.paystack.co/transaction/verify/$reference';
    try {
      http.Response response = await http.get(Uri.parse(url), headers: head);
      var body = response.body;
      _updateStatus(reference, body);
    } catch (e) {
      _updateStatus(
          reference,
          'There was a problem verifying %s on the backend: '
          '$reference $e');
    }
    setState(() => _inProgress = false);
  }

  _updateStatus(String? reference, String message) {
    _showMessage('Reference: $reference \n Response: $message',
        const Duration(seconds: 7));
  }

  _showMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: duration,
      action: SnackBarAction(
          label: 'CLOSE',
          onPressed: () =>
              ScaffoldMessenger.of(context).removeCurrentSnackBar()),
    ));
  }
}

var banks = ['Selectable', 'Bank', 'Card'];

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: const Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

const Color green = Color(0xFF3db76d);
const Color lightBlue = Color(0xFF34a5db);
const Color navyBlue = Color(0xFF031b33);