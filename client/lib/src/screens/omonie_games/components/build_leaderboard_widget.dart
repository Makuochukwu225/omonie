import 'package:omonie/src/src.dart';

class BuildLeardboardWidget extends StatelessWidget {
  const BuildLeardboardWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildTapItem(
              title: "General",
              index: 0,
              onTap: () {
                context.read<NavProvider>().gameTab = 0;
              },
            ),
            horizontalGap(10),
            buildTapItem(
              title: "Word it",
              index: 1,
              onTap: () {
                context.read<NavProvider>().gameTab = 1;
              },
            ),
            horizontalGap(10),
            buildTapItem(
              title: "Card Hero",
              index: 2,
              onTap: () {
                context.read<NavProvider>().gameTab = 2;
              },
            ),
          ],
        ),
        verticalGap(19),
        Container(
          // width: 402,
          // height: 45,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: const BoxDecoration(
              // border: Border.only(
              //   left: const BorderSide(color: Color(0xFF1F2226)),
              //   top: const BorderSide(color: Color(0xFF1F2226)),
              //   right: const BorderSide(color: Color(0xFF1F2226)),
              //   bottom: const BorderSide(width: 1, color: Color(0xFF1F2226)),
              // ),
              ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                // height: 15,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '#',
                                style: TextStyle(
                                  color: Color(0xFF6D7177),
                                  fontSize: 12,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              'Player',
                              style: TextStyle(
                                color: Color(0xFF6D7177),
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Gains',
                            style: TextStyle(
                              color: Color(0xFF6D7177),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Bet',
                            style: TextStyle(
                              color: Color(0xFF6D7177),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Plays',
                            style: TextStyle(
                              color: Color(0xFF6D7177),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Duration',
                            style: TextStyle(
                              color: Color(0xFF6D7177),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
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
        ),
        verticalGap(19),
        ListView.separated(
          itemBuilder: (context, index) => buildItemList(),
          separatorBuilder: (context, index) => verticalGap(),
          itemCount: 4,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
        )
      ],
    );
  }

  Widget buildTapItem({
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: provider.gameTab == index
                    ? const Color(0xFF7A58FF)
                    : const Color(0xFF6D7177),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 14,
              height: 2,
              decoration: BoxDecoration(
                color: provider.gameTab == index
                    ? const Color(0xFF7A58FF)
                    : Colors.transparent,
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildItemList() => Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 26,
                          padding: const EdgeInsets.only(
                            top: 3,
                            left: 5,
                            right: 5,
                            bottom: 3,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFFEB3D),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF33383F)),
                              borderRadius: BorderRadius.circular(80),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 10,
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                child: Text(
                                  'GiantKing',
                                  style: TextStyle(
                                    color: Color(0xFF101214),
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '৹94,573',
                    style: TextStyle(
                      color: Color(0xFF14DA63),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'e18,470',
                    style: TextStyle(
                      color: Color(0xFFDA0404),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '125',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '5:32',
                    style: TextStyle(
                      color: Color(0xFF6D7177),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
