import 'package:omonie/src/src.dart';

class AppHeader extends StatefulWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF1F2226),
          ),
        ),
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.assetsImagesOmonie,
            height: 41,
            width: 88,
          ),
          const Spacer(),
          SvgPicture.asset(Assets.assetsIconsNotification),
          horizontalGap(),
          buildDetailsWidget(),
        ],
      ),
    );
  }

  Widget buildDetailsWidget() => InkWell(
        onTap: () {
          push(context, const OmonieProfileScreen());
        },
        borderRadius: BorderRadius.circular(80),
        child: Consumer<UserProvider>(builder: (context, provider, _) {
          const placeHolder = CircleAvatar(
            backgroundImage: AssetImage(Assets.assetsImagesProfileImage),
          );
          return Container(
            height: 41,
            padding:
                const EdgeInsets.only(top: 3, left: 15, right: 5, bottom: 3),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF1F2226),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const ShapeDecoration(
                    color: Color(0xFF7A58FF),
                    shape: StarBorder.polygon(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFF0B0D0E),
                      ),
                      sides: 5,
                    ),
                  ),
                  child: Center(
                    child: Builder(
                      builder: (context) {
                        if (provider.hasData) {
                          return Text(
                            provider.userModel!.data!.level!.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }
                        return const Text(
                          '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                horizontalGap(3),
                Builder(builder: (context) {
                  if (provider.hasData) {
                    return Text(
                      provider.userModel!.data!.userName!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    );
                  }
                  return Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  );
                }),
                horizontalGap(15),
                Builder(builder: (context) {
                  if (provider.hasData) {
                    return Container(
                      width: 35,
                      clipBehavior: Clip.hardEdge,
                      height: 35,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFD9D9D9),
                        shape: OvalBorder(),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: provider.userModel!.data!.avatar!.image!,
                        errorWidget: (context, url, error) => placeHolder,
                        placeholder: (context, url) => placeHolder,
                      ),
                    );
                  }

                  return placeHolder;
                }),
              ],
            ),
          );
        }),
      );
}
