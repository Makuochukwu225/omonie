import 'package:omonie/src/src.dart';

class ForgetPassword1Screen extends StatefulWidget {
  const ForgetPassword1Screen({Key? key}) : super(key: key);

  @override
  State<ForgetPassword1Screen> createState() => _ForgetPassword1ScreenState();
}

class _ForgetPassword1ScreenState extends State<ForgetPassword1Screen> {
  int index = -1;
  var emailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'Please provide the email address linked to your account. ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(12),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'We will send a ',
                  style: TextStyle(
                    color: Color(0xFFBABDC2),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '6 digit code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text:
                      ' to the email address you provide. The code will expire in 40 secs.',
                  style: TextStyle(
                    color: Color(0xFFBABDC2),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          verticalGap(38),
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
            controller: emailsController,
            onChanged: (p0) {
              setState(() {});
            },
          ),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
                data: "SEND CODE",
                width: 189,
                onPressed: emailsController.text.isEmpty
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
    AuthService.sendPasswordOtp(email: emailsController.text).then((value) {
      AppDialog.cancelDialog(context);
      var b = context.read<AuthProvider>().data;
      context.read<AuthProvider>().data = b
        ..addAll({
          "email": emailsController.text,
        });
      context.read<NavProvider>().passwordController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
      AppMessage.showMessage(message: error.toString());
    });
  }
}
