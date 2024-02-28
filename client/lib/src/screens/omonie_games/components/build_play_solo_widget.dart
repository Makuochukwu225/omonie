import 'package:omonie/src/src.dart';

class BuildPlaySoloWidget extends StatelessWidget {
  const BuildPlaySoloWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var games2 = soloGames;
    return Column(
      children: [
        SizedBox(
          height: 278,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var game = games2[index];
                return buildItemTileWidget(data: game);
              },
              separatorBuilder: (context, index) => horizontalGap(),
              itemCount: games2.length),
        ),
        verticalGap(20),
        play(),
        verticalGap(20),
        const Divider(),
      ],
    );
  }

  Widget play() => Row(
        children: [
          const Text(
            'Play with Friends. Win Big!',
            style: TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(),
          Container(
            width: 151,
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF33383F),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.assetsIconsBoost),
                const Text(
                  'ENTER PVP',
                  style: TextStyle(
                    color: Color(0xFFDA0404),
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '234',
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
          )
        ],
      );

  Widget buildItemTileWidget({required GameModel data}) => Container(
        width: 196,
        height: 278,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 176,
              height: 140,
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    data.subtitle!,
                    style: const TextStyle(
                      color: Color(0xFFBABDC2),
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
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
          ],
        ),
      );
}
