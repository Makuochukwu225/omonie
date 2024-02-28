import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

class ShowNutSummaryWidget extends StatefulWidget {
  final Nut data;
  const ShowNutSummaryWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<ShowNutSummaryWidget> createState() => _ShowNutSummaryWidgetState();
}

class _ShowNutSummaryWidgetState extends State<ShowNutSummaryWidget> {
  @override
  void initState() {
    super.initState();
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
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const BuildHandle(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 38,
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF1F2226),
                        shape: OvalBorder(),
                      ),
                      child: const Icon(
                        Icons.arrow_back_sharp,
                        color: Color(0xFF33383F),
                      ),
                    ),
                  ),
                  horizontalGap(),
                  const Text(
                    'Buy Nuts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF33383F),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            verticalGap(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF282D35)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 103,
                          height: 103,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 24),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1F2226),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                width: 53,
                                height: 55,
                                imageUrl: widget.data.image!,
                                errorWidget: (context, url, error) =>
                                    Image.asset(Assets.assetsImagesOmonie),
                                placeholder: (context, url) =>
                                    Image.asset(Assets.assetsImagesOmonie),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '৹${widget.data.nutValue}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Color(0xFFFFEB3D),
                                fontSize: 32,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'N',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF6D7177),
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                                Text(
                                  '${widget.data.nairaValue}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  verticalGap(50),
                  const Text(
                    'Choose payment method',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  verticalGap(10),
                  cardOption(
                    title: "Naira Wallet",
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: false,
                          backgroundColor: Colors.transparent,
                          builder: (context) => BuildPinWidget(
                                data: widget.data,
                              ));
                    },
                    leading: Container(
                      padding: const EdgeInsets.only(
                        top: 3.50,
                        left: 6,
                        right: 7,
                        bottom: 3.50,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF14DA63),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'N',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalGap(20),
                  cardOption(
                    title: "Card",
                    onTap: () {},
                    leading: SvgPicture.asset(Assets.assetsIconsBank),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardOption({
    required Function()? onTap,
    required Widget leading,
    required String title,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: ShapeDecoration(
            color: const Color(0xFF0B0D0E),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading,
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: const ShapeDecoration(
                  color: Color(0xFF7A58FF),
                  shape: OvalBorder(),
                ),
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      );
}

class BuildPinWidget extends StatefulWidget {
  final Nut data;
  const BuildPinWidget({Key? key, required this.data}) : super(key: key);

  @override
  State<BuildPinWidget> createState() => _BuildPinWidgetState();
}

class _BuildPinWidgetState extends State<BuildPinWidget> {
  bool isLoading = false;
  Future checkPin() => Future.delayed(const Duration(seconds: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: Text(
                'Enter  4 digit pin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            horizontalGap(),
            Expanded(
                child: isLoading
                    ? const CupertinoActivityIndicator()
                    : const SizedBox()),
            horizontalGap(),
            SizedBox(
              width: 152,
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});

                  if (value.length > 3) {
                    setState(() {
                      isLoading = true;
                      checkPin().then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        AppDialog.showProcessingDialog(context: context);
                        NutService()
                            .buyNut(nutId: widget.data.id!)
                            .then((value) {
                          AppDialog.cancelDialog(context);
                          pop(context);
                          pop(context);
                          context.read<UserProvider>().fetchUser();

                          AppMessage.showMessage(
                              message: "Nut Purchased successfully");
                          pop(context);
                        }).onError((error, stackTrace) {
                          AppMessage.showMessage(message: error.toString());
                          AppDialog.cancelDialog(context);
                        });
                      });
                    });
                  }
                },
                style: const TextStyle(
                  color: Color(0xFF33383F),
                  fontSize: 22,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
                maxLength: 4,
                buildCounter: (context,
                        {int? currentLength, bool? isFocused, maxLength}) =>
                    const SizedBox(),
                keyboardType: const TextInputType.numberWithOptions(),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  fillColor: const Color(0xFF1F2226),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(46),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
