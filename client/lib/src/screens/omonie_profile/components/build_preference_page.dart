import 'package:omonie/src/src.dart';

class BuildPreferencePage extends StatefulWidget {
  const BuildPreferencePage({Key? key}) : super(key: key);

  @override
  State<BuildPreferencePage> createState() => _BuildPreferencePageState();
}

class _BuildPreferencePageState extends State<BuildPreferencePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Theme',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(15),
          Row(
            children: [
              themeItem(
                index: 0,
                title: "Dark",
                ontap: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),
              horizontalGap(10),
              themeItem(
                index: 1,
                title: "Light",
                ontap: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
              horizontalGap(10),
              themeItem(
                index: 2,
                title: "Device",
                ontap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),
            ],
          ),
          verticalGap(25),
          const Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              notificationItem(title: "Community"),
              horizontalGap(30),
              notificationItem(title: "Transactions"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              notificationItem(title: "Games"),
              horizontalGap(30),
              notificationItem(title: "Investment"),
            ],
          ),
          verticalGap(25),
          const Text(
            'Login & Security',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              notificationItem(title: "Use Biometrics"),
              horizontalGap(30),
              notificationItem(title: "Use 4 digit pin"),
            ],
          ),
          verticalGap(25),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Show my name when sharing profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(Assets.assetsIconsSwitch),
            ],
          ),
          verticalGap(50)
        ],
      ),
    );
  }

  Widget notificationItem({
    required String title,
  }) =>
      Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            SvgPicture.asset(Assets.assetsIconsSwitch),
          ],
        ),
      );

  Widget themeItem({
    required String title,
    required int index,
    required VoidCallback ontap,
  }) {
    bool selected = index == this.index;
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFBABDC2),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 5),
          SvgPicture.asset(
            selected ? Assets.assetsIconsChecked : Assets.assetsIconsCheck,
            colorFilter:
                const ColorFilter.mode(Color(0xFF7A58FF), BlendMode.srcIn),
          )
        ],
      ),
    );
  }
}
