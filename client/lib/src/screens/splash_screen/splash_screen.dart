import 'package:omonie/src/src.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) {
      PrefUtil.retrieveOnboarding().then((isFirstTime) {
        if (false) {
          pushRemoveAll(context, const OmonieLoginScreen());
        } else {
          TokenUtil.checkToken().then((value) {
            if (value) {
              pushRemoveAll(context, const OmonieLoginScreen());
            } else {
              pushRemoveAll(context, const OmonieMainScreen());
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.assetsImagesOmonie),
      ),
    );
  }
}
