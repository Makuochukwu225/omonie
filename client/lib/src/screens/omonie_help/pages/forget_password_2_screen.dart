import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class ForgetPassword2Screen extends StatefulWidget {
  const ForgetPassword2Screen({Key? key}) : super(key: key);

  @override
  State<ForgetPassword2Screen> createState() => _ForgetPassword2ScreenState();
}

class _ForgetPassword2ScreenState extends State<ForgetPassword2Screen> {
  int index = -1;
  bool isLoading = false;

  late Timer _timer;
  int _start = 45;
  bool canResendOtp = false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          canResendOtp = true;
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String formatCountdown(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String formattedCountdown =
        DateFormat('mm:ss').format(DateTime(0).add(duration));
    return formattedCountdown;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'We’ve sent a 6 Digit code to ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '\n${context.read<AuthProvider>().data['email']}',
                  style: const TextStyle(
                    color: Color(0xFF7A58FF),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          verticalGap(9),
          const Text(
            'Copy and insert the code into the boxes below before the time runs out.',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalGap(25),
          Row(
            children: [
              Text(
                formatCountdown(_start),
                style: const TextStyle(
                  color: Color(0xFFFFB13D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              horizontalGap(11),
              const Text(
                'Resend Code',
                style: TextStyle(
                  color: Color(0xFF7A58FF),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          verticalGap(40),
          Row(
            children: [
              const Text(
                'Enter 6 digit code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              isLoading ? const CupertinoActivityIndicator() : const SizedBox(),
            ],
          ),
          verticalGap(10),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 46,
              child: OtpTextField(
                numberOfFields: 6,
                fieldWidth: 46,
                borderColor: const Color(0xFF512DA8),
                mainAxisAlignment: MainAxisAlignment.start,
                showFieldAsBox: true,
                enabledBorderColor: const Color(0xFF282D35),
                margin: const EdgeInsets.only(right: 8.0),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  setState(() {
                    isLoading = true;
                  });
                  var b = context.read<AuthProvider>().data;
                  AuthService.verifyPasswordOtp(
                          email: b['email'], token: verificationCode)
                      .then((value) {
                    b["firstName"]= value['data']['firstName'];
                    setState(() {
                      isLoading = false;
                    });
                    context.read<NavProvider>().passwordController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }).onError((error, stackTrace) {
                    setState(() {
                      isLoading = false;
                    });
                    AppMessage.showMessage(message: error.toString());
                  });
                }, // end onSubmit
              ),
            ),
          ),
          verticalGap(60),
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
        ],
      ),
    );
  }
}
