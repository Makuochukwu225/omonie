import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class OmonieLoginScreen extends StatefulWidget {
  const OmonieLoginScreen({Key? key}) : super(key: key);

  @override
  State<OmonieLoginScreen> createState() => _OmonieLoginScreenState();
}

class _OmonieLoginScreenState extends State<OmonieLoginScreen> {
  var index = 0;
  var email = TextEditingController();
  var password = TextEditingController();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  bool obsecureText = true;
  bool isemailButtonEnabled = false;
  bool isPasswordButtonEnabled = false;
  bool switchCondition = true;

  @override
  Widget build(BuildContext context) {
    var loginWidget = <Widget>[
      Form(
        key: _emailKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              controller: email,
              hintText: "",
              onChanged: (value) {
                RegExp emailRegExp =
                    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
                // Add any additional logic you need
                setState(() {
                  isemailButtonEnabled =
                      value.isNotEmpty && emailRegExp.hasMatch(value);
                });
              },
              validator: (value) {
                RegExp emailRegExp =
                    RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");

                if (value!.isEmpty) {
                  return "email cannot be empty";
                } else if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      Form(
        key: _passwordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalGap(10),
            AppInput(
                controller: password,
                obscureText: obsecureText,
                onChanged: (value) {
                  RegExp passwordRegExp =
                      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

                  setState(() {
                    isPasswordButtonEnabled =
                        value.isNotEmpty && passwordRegExp.hasMatch(value);
                  });
                },
                validator: (value) {
                  RegExp passwordRegExp =
                      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  } else if (!passwordRegExp.hasMatch(value)) {
                    return 'Password must be at least 8 characters long, including one uppercase letter, one lowercase letter, and one digit';
                  }

                  return null;
                },
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      obsecureText = !obsecureText;
                    });
                  },
                  child: SvgPicture.asset(
                    Assets.assetsIconsPasswordEye,
                  ),
                )),
          ],
        ),
      ),
    ];

    return Scaffold(
      bottomSheet: buildBottomSheet(),
      body: Column(
        children: [
          AuthHeader(
            title: "Login",
            onBackPress: () {},
          ),
          verticalGap(40),
          Expanded(
              child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  reverseDuration: const Duration(milliseconds: 500),
                  switchInCurve: Curves.easeOut,
                  switchOutCurve: Curves.easeIn,
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  key: ValueKey<bool>(index == 0),
                  child: switchCondition ? loginWidget[0] : loginWidget[1],
                ),
                verticalGap(),
                Builder(builder: (context) {
                  if (password.text.length < 6 || isPasswordButtonEnabled) {
                    return const SizedBox();
                  }
                  return const Text(
                      "Password must contain at least one uppercase character, one lowercase character, one number, one symbol and 8 characters long.");
                }),
                verticalGap(100),
                buildNavButtonWidget(),
                verticalGap(50),
                buildCreateAccountText(),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget buildCreateAccountText() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const OmonieRegisterScreen(),
            ));
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Don’t have an account?',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Create an account.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavButtonWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index == 0
            ? const SizedBox.shrink()
            : Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                        switchCondition = true;
                      });
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
                ],
              ),
        AppButton(
          width: 190,
          data: "Next",
          onPressed: index == 0
              ? isemailButtonEnabled
                  ? () {
                      setState(() {
                        index = 1;
                        switchCondition = false;
                      });
                    }
                  : null
              : isPasswordButtonEnabled
                  ? () {
                      loginAccount();
                    }
                  : null,
        ),
      ],
    );
  }

  Widget buildBottomSheet() {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Having trouble Login in?',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              push(context, const OmonieHelpScreen());
            },
            child: const Text(
              'Get help.',
              style: TextStyle(
                color: Color(0xFF7A58FF),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  loginAccount() {
    AppDialog.showProcessingDialog(context: context);
    AuthService.login(email: email.text, password: password.text).then((model) {
      TokenUtil.persistToken(token: model.accessToken!).then((value) {
        AppDialog.cancelDialog(context);
        pushRemoveAll(context, OmonieLoginCompleteScreen(model: model));
      });
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
      AppMessage.showMessage(message: error.toString());
    });
  }
}
