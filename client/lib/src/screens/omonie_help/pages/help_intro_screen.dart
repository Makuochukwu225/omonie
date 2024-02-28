import 'package:flutter/material.dart';
import 'package:omonie/src/constants/assets.dart';
import 'package:omonie/src/widgets/app_button.dart';
import 'package:omonie/src/widgets/gap.dart';

import 'forget_email_intro_screen.dart';
import 'forget_password_intro_screen.dart';

class HelpIntroScreen extends StatefulWidget {
  const HelpIntroScreen({Key? key}) : super(key: key);

  @override
  State<HelpIntroScreen> createState() => _HelpIntroScreenState();
}

class _HelpIntroScreenState extends State<HelpIntroScreen> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalGap(40),
        const Text(
          'What seems to be the Problem?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalGap(60),
        Image.asset(
          Assets.assetsImagesLock,
          height: 200,
        ),
        verticalGap(24),
        buildItem(
          title: "I forgot my password",
          index: 0,
          onTap: () {
            setState(() {
              index = 0;
            });
          },
        ),
        verticalGap(15),
        buildItem(
          title: "I forgot my Email Address",
          index: 1,
          onTap: () {
            setState(() {
              index = 1;
            });
          },
        ),
        verticalGap(100),
        AppButton(
          data: "NEXT",
          width: 189,
          onPressed: index == -1
              ? null
              : () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, _, k) => index == 0
                            ? const ForgetPasswordIntroScreen()
                            : const ForgetEmailIntroScreen(),
                      ));
                },
        )
      ],
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
