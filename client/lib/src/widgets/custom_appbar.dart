import 'package:omonie/src/src.dart';

class CustomAppbar extends StatelessWidget {
  final Widget? more;
  final String? title;
  const CustomAppbar({Key? key, this.more, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
        left: 15,
        right: 15,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF1F2226),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              pop(context);
            },
            borderRadius: BorderRadius.circular(50),
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
          Text(
            title ?? 'Acccount',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              TokenUtil.clearToken().then((value) {
                pushRemoveAll(context, const SplashScreen());
              });
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Color(0xFF6D7177),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          more ?? const SizedBox(),
        ],
      ),
    );
  }
}
