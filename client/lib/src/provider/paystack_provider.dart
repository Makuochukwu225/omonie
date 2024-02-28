import 'package:omonie/src/src.dart';

class PaystackProvider extends ChangeNotifier {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _cardNumber;
  String? _cvv;
  int? _expiryMonth;
  int? _expiryYear;

  PaystackProvider();

  startAfreshCharge(
      {required BuildContext context,
      required UserModel model,
      required PaystackPayment plugin,
      required Function(bool isSuccessful) isSuccessful,
      required int amount}) async {
    Charge charge = Charge();
    charge.card = _getCardFromUI();

    _inProgress = true;
    notifyListeners();
    charge
      ..amount = amount * 100 // In base currency
      ..email = model.data!.email!
      ..reference = _getReference()
      ..putCustomField('Charged From', 'Flutter SDK');
    _chargeCard(
      charge: charge,
      amount: amount,
      context: context,
      isSuccessful: isSuccessful,
      plugin: plugin,
    );
  }

  _chargeCard(
      {required Charge charge,
      required BuildContext context,
      required Function(bool isSuccessful) isSuccessful,
      required int amount,
      required PaystackPayment plugin}) async {
    final response = await plugin.chargeCard(context, charge: charge);

    final reference = response.reference;

    // Checking if the transaction is successful
    if (response.status) {
      _verifyOnServer(reference, isSuccessful: isSuccessful, amount: amount);
      return;
    }

    // The transaction failed. Checking if we should verify the transaction
    if (response.verify) {
      _verifyOnServer(
        reference,
        isSuccessful: isSuccessful,
        amount: amount,
      );
    } else {
      _inProgress = false;
      notifyListeners();
      AppMessage.showMessage(message: response.message);
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

  void _verifyOnServer(String? reference,
      {required Function(bool isSuccessful) isSuccessful,
      required int amount}) async {
    PaymentService.verifyOnServer(
      reference: reference!,
      amount: amount,
    ).then((value) {
      _inProgress = false;
      isSuccessful(true);
      notifyListeners();

      AppMessage.showMessage(message: "Trxn successful");
    }).onError((error, stackTrace) {
      isSuccessful(false);
      _inProgress = false;
      notifyListeners();
      AppMessage.showMessage(message: error.toString());
    });
  }
}
