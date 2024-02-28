import 'package:omonie/src/src.dart';

class ForgetPassword3Screen extends StatefulWidget {
  const ForgetPassword3Screen({Key? key}) : super(key: key);

  @override
  State<ForgetPassword3Screen> createState() => _ForgetPassword3ScreenState();
}

class _ForgetPassword3ScreenState extends State<ForgetPassword3Screen> {
  int index = -1;
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();
  bool isFirstNameButtonEnabled = false;
  bool isLastNameButtonEnabled = false;
  bool obsecureText = true;
  bool obsecureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          Text(
            'It’s good to have you back, ${context.read<AuthProvider>().data["firstName"]}.',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(10),
          const Text(
            'You need a new password since you can’t remember your password.',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          verticalGap(60),
          const Text(
            'Create new Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          verticalGap(10),
          AppInput(
            controller: passwordController,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  obsecureText2 = !obsecureText2;
                });
              },
              child: SvgPicture.asset(
                Assets.assetsIconsPasswordEye,
              ),
            ),
            obscureText: obsecureText2,
            onChanged: (value) {
              RegExp passwordRegExp =
                  RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
              setState(() {
                isFirstNameButtonEnabled =
                    value.isNotEmpty && passwordRegExp.hasMatch(value);
              });
            },
          ),
          verticalGap(25),
          const Text(
            'Confirm password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          verticalGap(10),
          AppInput(
            controller: cPasswordController,
            obscureText: obsecureText,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
              child: SvgPicture.asset(
                Assets.assetsIconsPasswordEye,
              ),
            ),
            onChanged: (value) {
              RegExp passwordRegExp =
                  RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

              setState(() {
                isLastNameButtonEnabled = value.isNotEmpty &&
                    passwordRegExp.hasMatch(value) &&
                    passwordController.text == value;
              });
            },
          ),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<NavProvider>().passwordController.previousPage(
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
                data: "NEXT",
                width: 189,
                onPressed:
                    !(isFirstNameButtonEnabled && isLastNameButtonEnabled)
                        ? null
                        : () {
                            getOtp();
                          },
              ),
            ],
          )
        ],
      ),
    );
  }

  getOtp() {
    AppDialog.showProcessingDialog(context: context);
    var b = context.read<AuthProvider>().data;
    AppDialog.cancelDialog(context);
    AuthService.setPasswordOtp(
            email: b['email'], password: passwordController.text)
        .then((value) {
      push(context, const PasswordChangedScreen());
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
      AppMessage.showMessage(message: error.toString());
    });
  }
}
