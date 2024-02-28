import 'package:omonie/src/src.dart';

class OmonieRegisterScreen extends StatefulWidget {
  const OmonieRegisterScreen({Key? key}) : super(key: key);

  @override
  State<OmonieRegisterScreen> createState() => _OmonieRegisterScreenState();
}

class _OmonieRegisterScreenState extends State<OmonieRegisterScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      context.read<AuthProvider>().reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.controller.page!.toInt() == 0) {
            return true;
          }
          provider.controller.previousPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);

          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              const AuthHeader(
                title: "Create Account",
              ),
              Expanded(
                  child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                restorationId: "auth",
                controller: provider.controller,
                children: const [
                  NameScreen(),
                  EmailScreen(),
                  OtpScreen(),
                  PasswordScreen(),
                  DateScreen(),
                  GenderScreen(),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }
}
