import 'package:omonie/src/src.dart';

class OmonieLoginCompleteScreen extends StatefulWidget {
  final LoginModel model;
  const OmonieLoginCompleteScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<OmonieLoginCompleteScreen> createState() =>
      _OmonieLoginCompleteScreenState();
}

class _OmonieLoginCompleteScreenState extends State<OmonieLoginCompleteScreen> {
  double value = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      const int totalSteps = 100;
      int currentStep = 0;

      _timer = Timer.periodic(const Duration(milliseconds: 60), (timer) {
        setState(() {
          value = currentStep / totalSteps;
          currentStep++;

          if (currentStep > totalSteps) {
            _timer!.cancel();
            pushRemoveAll(context, const OmonieMainScreen());
          }
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalGap(100),
            Image.asset(
              Assets.assetsImagesOmonieV2,
              height: 50,
              width: 160,
              fit: BoxFit.contain,
            ),
            verticalGap(50),
            Text(
              'Welcome back, ${widget.model.firstName}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalGap(100),
            SizedBox(
              width: 150,
              height: 5,
              child: LinearProgressIndicator(
                value: value,
                color: const Color(0xFF7A58FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
