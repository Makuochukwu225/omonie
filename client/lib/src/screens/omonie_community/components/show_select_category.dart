import 'package:omonie/src/src.dart';

class ShowSelectCategory {
  show({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const SelectCategory(),
    );
  }
}

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
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
                IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF33383F),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Text(
            'What type of content do you want to post today?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _item(
                  src: Assets.assetsImagesArticle,
                  index: 0,
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  color: const Color(0xFFE9BB38),
                  title: "Article",
                ),
              ),
              Expanded(
                  child: _item(
                src: Assets.assetsImagesGiveaway,
                index: 1,
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                color: const Color(0xFF3F075A),
                title: "GIveaway",
              )),
              Expanded(
                  child: _item(
                src: Assets.assetsImagesPoll,
                index: 2,
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                color: const Color(0xFF071E5A),
                title: "Poll",
              )),
            ],
          ),
          AppButton(
            width: 190,
            data: "Next",
            onPressed: index == -1
                ? null
                : () {
                    pop(context);
                    switch (index) {
                      case 0:
                        data = {"type": "Article"};
                        break;
                      case 1:
                        data = {"type": "Giveaway"};
                        break;
                      case 2:
                        data = {"type": "Poll"};
                        break;
                      default:
                    }
                    ShowEnterDetails().show(context: context, data: data);
                  },
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String src,
    required int index,
    required VoidCallback onTap,
    required Color color,
    required String title,
  }) =>
      InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(src),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
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
        ),
      );
}
