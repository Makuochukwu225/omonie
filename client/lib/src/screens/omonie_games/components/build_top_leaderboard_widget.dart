import 'package:flutter/material.dart';
import 'package:omonie/src/constants/assets.dart';
import 'package:omonie/src/widgets/gap.dart';

class BuildTopLeaderBoard extends StatelessWidget {
  const BuildTopLeaderBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'LEADERBOARD',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalGap(20),
        const Text(
          'TODAY’S 👑TOP PLAYERS',
          style: TextStyle(
            color: Color(0xFF6D7177),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        verticalGap(20),
        SizedBox(
          height: 190,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return buildItem();
              },
              separatorBuilder: (context, index) => horizontalGap(15),
              itemCount: 3),
        )
      ],
    );
  }

  Widget buildItem() => Container(
        width: 189,
        // height: 164,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: ShapeDecoration(
          color: const Color(0xFF1F2226),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x3A4D0DD4)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1C6047FF),
              blurRadius: 29.80,
              offset: Offset(-6, 11),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '#1',
                  style: TextStyle(
                    color: Color(0xFFFFEB3D),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 2),
                Container(
                  padding: const EdgeInsets.only(
                    top: 3,
                    left: 5,
                    right: 15,
                    bottom: 3,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFEB3D),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF33383F)),
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(Assets.assetsImagesProfile1),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'GiantKing',
                        style: TextStyle(
                          color: Color(0xFF101214),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalGap(15),
            const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Plays:',
                      style: TextStyle(
                        color: Color(0xFF6D7177),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '120',
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
                SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wins:',
                      style: TextStyle(
                        color: Color(0xFF6D7177),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '89',
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
                SizedBox(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gains:',
                      style: TextStyle(
                        color: Color(0xFF6D7177),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'e12,234',
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
              ],
            ),
          ],
        ),
      );
}
