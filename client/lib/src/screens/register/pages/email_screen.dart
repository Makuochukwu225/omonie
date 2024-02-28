import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isFirstNameButtonEnabled = false;
  bool isLastNameButtonEnabled = false;
  var email = TextEditingController();
  var phone = TextEditingController();

  CountryCode? pick =
      const CountryCode(code: "NG", name: "Nigeria", dialCode: "+234");


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<AuthProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalGap(40),
                  const Text(
                    'Welcome, Collins.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  verticalGap(18),
                  const Text(
                    'Enter your email address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalGap(10),
                  AppInput(
                    hintText: "@gmail.com",
                    textColor: provider.isAvailable == null
                        ? null
                        : !provider.isAvailable!
                            ? const Color(0xFF7A58FF)
                            : null,
                    controller: email,
                    onChanged: (value) {
                      RegExp emailRegExp = RegExp(
                          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
                      if (value.isNotEmpty && emailRegExp.hasMatch(value)) {
                        AuthService.checkEmail(email: value).then((value) {
                          provider.isAvailable = value;
                        }).onError((error, stackTrace) {
                          setState(() {
                            provider.isAvailable = false;
                          });
                        });
                      }

                      setState(() {
                        isFirstNameButtonEnabled = value.isNotEmpty;
                      });
                    },
                  ),
                  Builder(builder: (context) {
                    if (provider.isLoading) {
                      return const CupertinoActivityIndicator();
                    }
                    return provider.isAvailable == null
                        ? const SizedBox()
                        : Text(!provider.isAvailable!
                            ? "email available"
                            : "email already in use");
                  }),
                  verticalGap(25),
                  const Text(
                    'Phone number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalGap(10),
                  AppInput(
                    hintText: "90 342 5674",
                    prefix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          const countryPicker = FlCountryCodePicker();

                          final picked = await countryPicker.showPicker(
                            context: context,
                            backgroundColor: bgColorDark,
                          );

                          if (picked != null) {
                            setState(() {
                              pick = picked;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pick!.dialCode,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Color(0xFF6D7177),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SvgPicture.asset(Assets.assetsIconsArrowDown),
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller: phone,
                    onChanged: (value) {
                      setState(() {
                        isLastNameButtonEnabled =
                            value.isNotEmpty && value.length > 9;
                      });
                    },
                  ),
                  verticalGap(100),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<NavProvider>().controller.previousPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF1F2226),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      horizontalGap(15),
                      AppButton(
                          width: 190,
                          data: "Next",
                          onPressed: provider.isAvailable == null
                              ? null
                              : (isFirstNameButtonEnabled &&
                                      isLastNameButtonEnabled &&
                                      !provider.isAvailable!)
                                  ? () {
                                      getOtp();
                                    }
                                  : null),
                    ],
                  ),
                  verticalGap(75),
                  const BuildSocialLoginWidget()
                ],
              ),
            ),
          ),
          const BuildCreateAccountText(),
        ],
      );
    });
  }

  getOtp() {
    AppDialog.showProcessingDialog(context: context);
    AuthService.sendOtp(email: email.text).then((value) {
      AppDialog.cancelDialog(context);
      var b = context.read<AuthProvider>().data;
      context.read<AuthProvider>().data = b
        ..addAll({
          "email": email.text,
          "phoneNumber": "${pick!.dialCode}${phone.text}",
        });
      context.read<NavProvider>().controller.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
      AppMessage.showMessage(message: error.toString());
    });
  }
}
