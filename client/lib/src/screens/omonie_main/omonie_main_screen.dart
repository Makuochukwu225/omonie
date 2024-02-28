import 'package:omonie/src/src.dart';

class OmonieMainScreen extends StatefulWidget {
  const OmonieMainScreen({Key? key}) : super(key: key);

  @override
  State<OmonieMainScreen> createState() => _OmonieMainScreenState();
}

class _OmonieMainScreenState extends State<OmonieMainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      context.read<UserProvider>().fetchUser();
      context.read<PostProvider>().fetchPost();
      context.read<AssetProvider>().fetchAvatars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: bgColorDark,
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsGames,
                    colorFilter: ColorFilter.mode(
                        provider.index == 0
                            ? selectedIconColor
                            : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                  label: "Games"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsCommunity,
                    colorFilter: ColorFilter.mode(
                        provider.index == 1
                            ? selectedIconColor
                            : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                  label: "Community"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsStore,
                    colorFilter: ColorFilter.mode(
                        provider.index == 2
                            ? selectedIconColor
                            : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                  label: "Store"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsInvestment,
                    colorFilter: ColorFilter.mode(
                        provider.index == 3
                            ? selectedIconColor
                            : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                  label: "Investment"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    Assets.assetsIconsFund,
                    colorFilter: ColorFilter.mode(
                        provider.index == 4
                            ? selectedIconColor
                            : unselectedIconColor,
                        BlendMode.srcIn),
                  ),
                  label: "Funds"),
            ],
            onTap: (value) {
              provider.index = value;
            },
            currentIndex: provider.index,
            useLegacyColorScheme: false,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 12,
              color: selectedIconColor,
              fontWeight: FontWeight.w700,
            ),
            showSelectedLabels: true,
            unselectedLabelStyle: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: unselectedIconColor,
            ),
            selectedItemColor: selectedIconColor,
          ),
          body: Column(
            children: [
              const AppHeader(),
              Expanded(child: provider.pages[provider.index]),
            ],
          ),
        );
      },
    );
  }
}
