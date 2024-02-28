import 'package:omonie/src/src.dart';

class BuildProperty extends StatefulWidget {
  const BuildProperty({Key? key}) : super(key: key);

  @override
  State<BuildProperty> createState() => _BuildPropertyState();
}

class _BuildPropertyState extends State<BuildProperty> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Consumer<UserProvider>(
                  builder: (context, provider, _) {
                    if (provider.hasData && !provider.isLoading) {
                      return buildOption(
                          key: "RANK",
                          value: provider.userModel!.data!.level!.toString());
                    }
                    return buildOption(
                        key: "RANK",
                        value: "0",
                        more: CustomPaint(
                          size: const Size(50, 50),
                          painter: PolygonPainter(),
                        ));
                  },
                ),
              ),
              Expanded(
                child: Consumer<UserProvider>(
                  builder: (context, provider, _) {
                    if (provider.hasData && !provider.isLoading) {
                      return buildOption(
                          key: "FOLLOWING",
                          value: provider.userModel!.data!.followingCount!
                              .toString());
                    }
                    return buildOption(key: "FOLLOWING", value: "0");
                  },
                ),
              ),
              Expanded(
                child: Consumer<UserProvider>(
                  builder: (context, provider, _) {
                    if (provider.hasData && !provider.isLoading) {
                      return buildOption(
                          key: "FOLLOWERS",
                          value: provider.userModel!.data!.followerCount!
                              .toString());
                    }
                    return buildOption(key: "FOLLOWERS", value: "0");
                  },
                ),
              ),
              Expanded(child: buildOption(key: "AWARDS", value: "0")),
            ],
          ),
          isOpen
              ? Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Consumer<UserProvider>(
                            builder: (context, provider, _) {
                          if (provider.hasData && !provider.isLoading) {
                            return buildOption(
                                key: "POSTS",
                                value: provider.userModel!.data!.postCount!
                                    .toString());
                          }
                          return buildOption(key: "POSTS", value: "0");
                        })),
                        Expanded(
                            child: buildOption(key: "ESSENCE", value: "0")),
                        Expanded(
                            child:
                                buildOption(key: "GAMES PLAYED", value: "0")),
                        Expanded(
                            child: buildOption(key: "GAMES WON", value: "0")),
                      ],
                    ),
                    Row(
                      children: [
                        buildOption(key: "ALL THE GAME", value: "0"),
                        horizontalGap(20),
                        const Text(
                          'Member since Jan, 15. 2024',
                          style: TextStyle(
                            color: Color(0xFFBABDC2),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
          verticalGap(20),
          InkWell(
            onTap: () => setState(() {
              isOpen = !isOpen;
            }),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isOpen ? 'LESS' : "MORE",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF6D7177),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: const Color(0xFF6D7177),
                  size: 15,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildOption({
    Widget? more,
    required String key,
    required String value,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                key,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 10,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              more ?? const SizedBox(),
            ],
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      );
}
