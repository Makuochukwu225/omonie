import 'package:omonie/src/src.dart';

class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.assetsImagesLock,
              height: 200,
            ),
            verticalGap(20),
            const Text(
              'Congrats on regaining access to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            verticalGap(20),
            const Text(
              'Please login with your new password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            verticalGap(60),
            AppButton(
              data: "LOGIN",
              width: 189,
              onPressed: () {
                pushRemoveAll(context, const OmonieLoginScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
