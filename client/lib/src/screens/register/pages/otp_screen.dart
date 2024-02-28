import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'Confirm your email address',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: 'A 6 digit code was sent to: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '${context.read<AuthProvider>().data["email"]}',
                  style: const TextStyle(
                    color: Color(0xFF7A58FF),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                borderColor: const Color(0xFF512DA8),
                showFieldAsBox: true,
                enabledBorderColor: const Color(0xFF282D35),
                margin: const EdgeInsets.only(right: 8.0),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  setState(() {
                    isLoading = true;
                  });
                  var b = context.read<AuthProvider>().data;
                  AuthService.verifyOtp(
                          email: b['email'], token: verificationCode)
                      .then((value) {
                    setState(() {
                      isLoading = false;
                    });
                    context.read<NavProvider>().controller.nextPage(
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
        ],
      ),
    );
  }
}
