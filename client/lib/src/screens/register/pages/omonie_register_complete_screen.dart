import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omonie/src/constants/assets.dart';
import 'package:omonie/src/screens/login/omoni_login_screen.dart';
import 'package:omonie/src/widgets/gap.dart';

class OmonieRegisterCompleteScreen extends StatefulWidget {
  const OmonieRegisterCompleteScreen({Key? key}) : super(key: key);

  @override
  State<OmonieRegisterCompleteScreen> createState() =>
      _OmonieRegisterCompleteScreenState();
}

class _OmonieRegisterCompleteScreenState
    extends State<OmonieRegisterCompleteScreen> {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OmonieLoginScreen(),
                ));
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
            const Text(
              '',
              style: TextStyle(
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
