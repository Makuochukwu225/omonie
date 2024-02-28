import 'package:flutter/material.dart';
import 'package:omonie/src/models/game_model.dart';
import 'package:omonie/src/screens/omonie_games/components/build_upcoming_event.dart';
import 'package:omonie/src/widgets/gap.dart';

class BuildPvpWidget extends StatelessWidget {
  const BuildPvpWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var games2 = pvpGames;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var game = games2[index];
              return buildItemTileWidget(data: game);
            },
            separatorBuilder: (context, index) => horizontalGap(),
            itemCount: games2.length),
        verticalGap(30),
        const BuildUpcomingEvent(),
      ],
    );
  }

  Widget buildItemTileWidget({required GameModel data}) => Container(
        height: 137,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 114,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Container(
                width: 183,
                height: 183,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(data.src!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Castle of Cards PvP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Compete with friends to save the Princes from evil.',
                    style: TextStyle(
                      color: Color(0xFFBABDC2),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 35,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
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
                          'PLAY',
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
            ),
          ],
        ),
      );
}
