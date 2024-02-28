import 'package:flutter/material.dart';
import 'package:omonie/src/screens/omonie_community/components/components.dart';

class BuildSearch extends StatelessWidget {
  const BuildSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 35,
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 10,
              bottom: 10,
            ),
            decoration: ShapeDecoration(
              color: const Color(0xFF1F2226),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Find',
                  style: TextStyle(
                    color: Color(0xFF6D7177),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            ShowSelectCategory().show(context: context);
          },
          child: Container(
            width: 128,
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF7A58FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CREATE POST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
