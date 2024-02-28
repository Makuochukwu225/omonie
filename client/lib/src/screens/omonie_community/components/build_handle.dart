import 'package:flutter/material.dart';
import 'package:omonie/src/src.dart';

class BuildHandle extends StatelessWidget {
  const BuildHandle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 5,
      decoration: ShapeDecoration(
        color: const Color(0xFF33383F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
