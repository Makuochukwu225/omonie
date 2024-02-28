import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

class EnterNutWidget extends StatefulWidget {
  final UserData data;
  const EnterNutWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<EnterNutWidget> createState() => _EnterNutWidgetState();
}

class _EnterNutWidgetState extends State<EnterNutWidget> {
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
    return Consumer<UserProvider>(builder: (context, provider, _) {
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
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFF33383F),
                      ),
                    ),
                    const Text(
                      'Share Nut',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '৹',
                                  style: TextStyle(
                                    color: Color(0xFF6D7177),
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${provider.userModel!.data!.availableNut!}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Text(
                                  '.00',
                                  style: TextStyle(
                                    color: Color(0xFF6D7177),
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'N17500',
                          style: TextStyle(
                            color: Color(0xFF6D7177),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    verticalGap(40),
                    Row(
                      children: [
                        const Text(
                          'Send Nuts to',
                          style: TextStyle(
                            color: Color(0xFFBABDC2),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF14DA63),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Icon(Icons.add)],
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            width: 30,
                            height: 30,
                            // imageUrl: "",
                            imageUrl: widget.data.avatar!.image!,
                            errorWidget: (context, url, error) =>
                                Image.asset(Assets.assetsImagesOmonie),
                            placeholder: (context, url) =>
                                Image.asset(Assets.assetsImagesOmonie),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.userName!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.close),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildAmountWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Amount to send',
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
                '৹',
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
                    NutService()
                        .transferNut(
                            userId: widget.data.id!,
                            nut: int.parse(controller.text))
                        .then((value) {
                      context.read<UserProvider>().fetchUser();
                      pop(context);
                      AppDialog.cancelDialog(context);
                      AppMessage.showMessage(message: "Nuts sent");
                    }).onError((error, stackTrace) {
                      AppDialog.cancelDialog(context);
                      AppMessage.showMessage(message: error.toString());
                    });
                  },
            data: "Next",
          ),
        ],
      ),
    );
  }
}
