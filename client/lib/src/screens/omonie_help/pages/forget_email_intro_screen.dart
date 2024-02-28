import 'package:omonie/src/src.dart';

class ForgetEmailIntroScreen extends StatefulWidget {
  const ForgetEmailIntroScreen({Key? key}) : super(key: key);

  @override
  State<ForgetEmailIntroScreen> createState() => _ForgetEmailIntroScreenState();
}

class _ForgetEmailIntroScreenState extends State<ForgetEmailIntroScreen> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return WillPopScope(
        onWillPop: () async {
          if (provider.controller.page!.toInt() == 0) {
            return true;
          }
          provider.emailController.previousPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut);

          return false;
        },
        child: Scaffold(
          bottomSheet: buildBottomSheet(),
          body: Column(
            children: [
              const AuthHeader(
                title: "Can’t Login? Help is here.",
              ),
              Expanded(
                  child: PageView(
                controller: provider.emailController,
                children: const [
                  ForgetEmailScreen(),
                  ForgetEmail2Screen(),
                ],
              ))
            ],
          ),
        ),
      );
    });
  }

  Widget buildBottomSheet() {
    return SizedBox(
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Or',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalGap(10),
          const Text(
            'Contact customer care.',
            style: TextStyle(
              color: Color(0xFF7A58FF),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
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
