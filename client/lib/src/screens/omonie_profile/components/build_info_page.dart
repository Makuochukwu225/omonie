import 'package:omonie/src/src.dart';

class BuildInfoPage extends StatelessWidget {
  const BuildInfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (provider.hasData) {
                  return buildItem(
                      title: "Phone",
                      subtitle: provider.userModel!.data!.phoneNumber!);
                }
                return buildItem(title: "Phone", subtitle: "");
              }),
              const Divider(),
              Builder(builder: (context) {
                if (provider.hasData) {
                  return buildItem(
                      title: "Email address",
                      subtitle: provider.userModel!.data!.email!);
                }
                return buildItem(title: "Email address", subtitle: "subtitle");
              }),
              const Divider(),
              Builder(builder: (context) {
                if (provider.hasData) {
                  return buildItem(title: "Password", subtitle: "****");
                }
                return buildItem(title: "Password", subtitle: "****");
              }),
              const Divider(),
              Builder(builder: (context) {
                if (provider.hasData) {
                  return buildItem(title: "Four Digit Pin", subtitle: "****");
                }
                return buildItem(title: "Four Digit Pin", subtitle: "****");
              }),
              const Divider(),
            ],
          ),
        );
      },
    );
  }

  Row buildItem({
    required String title,
    required String subtitle,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const Spacer(),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFFBABDC2),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        SvgPicture.asset(Assets.assetsIconsForward)
      ],
    );
  }
}
