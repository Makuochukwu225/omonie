import 'package:omonie/src/src.dart';

class AuthHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onBackPress;
  const AuthHeader({Key? key, this.title, this.onBackPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.only(
        top: 30,
        left: 15,
        right: 15,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF101214),
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFF1F2226)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          GestureDetector(
            onTap: onBackPress ??
                () {
                  Navigator.pop(context);
                },
            child: SvgPicture.asset(
              Assets.assetsIconsBackArrow,
            ),
          )
        ],
      ),
    );
  }
}
