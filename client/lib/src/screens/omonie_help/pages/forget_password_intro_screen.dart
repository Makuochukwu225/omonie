import 'package:omonie/src/src.dart';

class ForgetPasswordIntroScreen extends StatefulWidget {
  const ForgetPasswordIntroScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordIntroScreen> createState() =>
      _ForgetPasswordIntroScreenState();
}

class _ForgetPasswordIntroScreenState extends State<ForgetPasswordIntroScreen> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.passwordController.page!.toInt() == 0) {
            return true;
          }
          provider.passwordController.previousPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);

          return false;
        },
        child: Scaffold(
          body: Column(
            children: [
              const AuthHeader(
                title: "Can’t Login? Help is heure.",
              ),
              Expanded(
                  child: PageView(
                controller: provider.passwordController,
                children: const [
                  ForgetPassword1Screen(),
                  ForgetPassword2Screen(),
                  ForgetPassword3Screen(),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }

  Widget buildItem({
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 289,
        height: 40,
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: index == this.index
                ? const BorderSide(width: 1, color: Color(0xFF14DA63))
                : const BorderSide(width: 1, color: Color(0xFF282D35)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
