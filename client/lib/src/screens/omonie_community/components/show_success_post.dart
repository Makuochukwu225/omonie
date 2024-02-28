import 'package:omonie/src/src.dart';

class ShowSuccessPost {
  show({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SuccessPost(),
    );
  }
}

class SuccessPost extends StatefulWidget {
  const SuccessPost({Key? key}) : super(key: key);

  @override
  State<SuccessPost> createState() => _SuccessPostState();
}

class _SuccessPostState extends State<SuccessPost> {
  int index = -1;
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        // left: 30,
        // right: 30,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFF0C0D0F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          const BuildHandle(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF33383F),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Spacer(),
          Image.asset(Assets.assetsImagesSuccessPost),
          verticalGap(50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 400,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF7A58FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'SHARE YOUR POST',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalGap(20),
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 400,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0B0D0E),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF1F2226)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'GO TO POST',
                          style: TextStyle(
                            color: Color(0xFF6D7177),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalGap(50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
