import 'package:flutter/material.dart';
import 'package:omonie/src/widgets/gap.dart';

class BuildSubscribeWidget extends StatelessWidget {
  const BuildSubscribeWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        carouselItem(),
        verticalGap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            carouselIndicator(),
            horizontalGap(10),
            carousel2Indicator(),
            horizontalGap(10),
            carousel2Indicator(),
          ],
        ),
      ],
    );
  }

  Widget carouselIndicator() => Container(
        width: 9,
        height: 9,
        decoration: const ShapeDecoration(
          color: Color(0xFF6D7177),
          shape: OvalBorder(),
        ),
      );
  Widget carousel2Indicator() => Container(
        width: 9,
        height: 9,
        decoration: const ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(width: 1, color: Color(0xFF33383F)),
          ),
        ),
      );

  Widget carouselItem() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFB7AD),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'STAND OUT WITH PREMIUM',
              style: TextStyle(
                color: Color(0xFF101214),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Omonie BOSS',
              style: TextStyle(
                color: Color(0xFF101214),
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Explore all Premium Benefits',
                  style: TextStyle(
                    color: Color(0xFF101214),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 128,
                  height: 35,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F2226),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Subscribe',
                        style: TextStyle(
                          color: Color(0xFFFFB13D),
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
          ],
        ),
      );
}
