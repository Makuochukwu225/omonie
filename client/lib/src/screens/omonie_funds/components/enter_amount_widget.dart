import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

class EnterAmountWidget extends StatefulWidget {
  const EnterAmountWidget({Key? key}) : super(key: key);

  @override
  State<EnterAmountWidget> createState() => _EnterAmountWidgetState();
}

class _EnterAmountWidgetState extends State<EnterAmountWidget> {
  PaystackPayment plugin = PaystackPayment();
  @override
  void initState() {
    super.initState();
    plugin.initialize(
        publicKey: "pk_test_bec5031b88d11d78bf5e78c71fb128ac5191c4fc");
  }

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFF0C0D0F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        bottomSheet: buildAmountWidget(),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const BuildHandle(),
            SizedBox(
              height: 38,
              width: double.infinity,
              child: Stack(
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    bottom: 10,
                    child: Text(
                      'Fund Your Naira wallet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 15,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () {
                        pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF33383F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget buildAmountWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Amount to buy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(25),
          TextFormField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
            onChanged: (value) {
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: "1000",
              prefix: Text(
                'N',
                style: TextStyle(
                  color: Color(0xFF282D35),
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              hintStyle: TextStyle(
                color: Color(0xFF282D35),
                fontSize: 42,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          verticalGap(),
          AppButton(
            width: double.infinity,
            onPressed: (controller.text.isEmpty)
                ? null
                : () {
                    AppDialog.showProcessingDialog(context: context);
                    var read = context.read<UserProvider>();
                    context.read<PaystackProvider>().startAfreshCharge(
                        isSuccessful: (isSuccessful) {
                          AppDialog.cancelDialog(context);
                          pop(context);
                          if (isSuccessful) {
                            read.fetchUser();

                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => const SuccessPayment());
                          }
                        },
                        plugin: plugin,
                        context: context,
                        model: read.userModel!,
                        amount: int.parse(controller.text));
                  },
            data: "Next",
          ),
        ],
      ),
    );
  }
}
