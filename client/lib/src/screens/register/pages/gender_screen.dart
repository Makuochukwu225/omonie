import 'package:omonie/src/src.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen>
    with AutomaticKeepAliveClientMixin {
  int index = -1;
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'What’s your Gender?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(39),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildItem(
                src: Assets.assetsImagesMale,
                color: const Color(0xFFE9BB38),
                index: 0,
                title: "Male",
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
              const SizedBox(width: 30),
              buildItem(
                src: Assets.assetsImagesFemale,
                color: const Color(0xFF3F075A),
                index: 1,
                title: "Female",
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
              const SizedBox(width: 30),
              buildItem(
                src: Assets.assetsImagesOther,
                color: const Color(0xFF071E5A),
                index: 2,
                title: "Other",
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),
            ],
          ),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<NavProvider>().controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut);
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF1F2226),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              horizontalGap(15),
              AppButton(
                  width: 190,
                  data: "Next",
                  onPressed: index == -1
                      ? null
                      : () {
                          var b = context.read<AuthProvider>().data;
                          context.read<AuthProvider>().data = b
                            ..addAll({
                              "gender": gender(index),
                            });
                          context.read<AvatarProvider>().fetchAvatars();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AvatarScreen(),
                              ));
                        }),
            ],
          ),
        ],
      ),
    );
  }

  String gender(int index) {
    switch (index) {
      case 0:
        return "Male";

      case 1:
        return "Female";
      case 2:
        return "Other";
      default:
        return "";
    }
  }

  Widget buildItem({
    required String src,
    required int index,
    required VoidCallback onTap,
    required Color color,
    required String title,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          decoration: index != this.index
              ? null
              : ShapeDecoration(
                  color: const Color(0xFF1F2226),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      image: DecorationImage(
                          fit: BoxFit.contain, image: AssetImage(src)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: index == this.index
                              ? Colors.white
                              : const Color(0xFF6D7177),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 5),
                      index == this.index
                          ? SvgPicture.asset(Assets.assetsIconsChecked)
                          : SvgPicture.asset(Assets.assetsIconsCheck),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
