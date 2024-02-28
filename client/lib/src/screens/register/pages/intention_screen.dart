import 'package:omonie/src/src.dart';

class IntentionScreen extends StatefulWidget {
  const IntentionScreen({Key? key}) : super(key: key);

  @override
  State<IntentionScreen> createState() => _IntentionScreenState();
}

class _IntentionScreenState extends State<IntentionScreen> {
  int index = -1;
  List<String> s = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalGap(100),
            Text(
              'Welcome to Omonie, ${context.read<AuthProvider>().data["firstName"]}.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'We are an invetment, gaming and learning platform.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            verticalGap(40),
            const Text(
              'What will you do in Omonie?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalGap(35),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                children: [
                  ...choiceList
                      .asMap()
                      .entries
                      .map((e) => buildItem(
                          src: e.value.src!,
                          index: e.key,
                          onTap: () {
                            setState(() {
                              print(e.key);
                              print(choiceList.length);
                              index = e.key;
                              // if (e.key + 1 == choiceList.length) {
                              if (e.key + 1 == choiceList.length) {
                                s.clear();
                                s.add(e.value.title!);
                                return;
                              } else {
                                s.remove(e.value.title!);
                              }
                              // }

                              if (s.contains(e.value.title!)) {
                                s.remove(e.value.title!);
                              } else {
                                s.add(e.value.title!);
                              }
                            });
                          },
                          color: e.value.color!,
                          title: e.value.title!))
                      .toList()
                ],
              ),
            ),
            verticalGap(50),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
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
                  ],
                ),
                AppButton(
                  width: 190,
                  data: "CONTINUE",
                  onPressed: s.isEmpty
                      ? null
                      : () {
                          var b = context.read<AuthProvider>().data;
                          context.read<AuthProvider>().data = b
                            ..addAll({
                              "intentions": s,
                            });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TermAndConditionScreen(),
                              ));
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem({
    required String src,
    required int index,
    required VoidCallback onTap,
    required Color color,
    required String title,
  }) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
          decoration: !s.contains(title)
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
                      image: src == ""
                          ? null
                          : DecorationImage(
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
                          color: s.contains(title)
                              ? Colors.white
                              : const Color(0xFF6D7177),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 5),
                      s.contains(title)
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
