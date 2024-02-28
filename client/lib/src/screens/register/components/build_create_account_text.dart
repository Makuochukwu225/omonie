import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class BuildCreateAccountText extends StatelessWidget {
  const BuildCreateAccountText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const OmonieLoginScreen(),
              ));
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Login here.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
