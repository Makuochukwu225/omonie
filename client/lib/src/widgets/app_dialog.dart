import 'package:omonie/src/src.dart';

class AppDialog {
  static showProcessingDialog({
    required BuildContext context,
  }) {
    showGeneralDialog(
        barrierDismissible: false,
        context: context,
        pageBuilder: (c, v, g) {
          return Center(
            child: Container(
              width: 75.06,
              height: 74.90,
              decoration: BoxDecoration(
                color: bgColorDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  static cancelDialog(BuildContext context) {
    Navigator.pop(context);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: SvgPicture.asset(Assets.assetsImagesOmonie),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
