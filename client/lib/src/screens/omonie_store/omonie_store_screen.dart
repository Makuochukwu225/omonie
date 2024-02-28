import 'package:omonie/src/src.dart';

class OmonieStoreScreen extends StatefulWidget {
  const OmonieStoreScreen({Key? key}) : super(key: key);

  @override
  State<OmonieStoreScreen> createState() => _OmonieStoreScreenState();
}

class _OmonieStoreScreenState extends State<OmonieStoreScreen> {
  final List<String> items = [
    'Avatar',
    'Award',
    'Badge',
    'Frame',
    'Game Booster',
    'Sticker',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AssetProvider>(builder: (context, provider, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const BuildSubscribeWidget(),
              verticalGap(30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTapItem(
                    title: "Main",
                    index: 0,
                    onTap: () {
                      context.read<NavProvider>().store = 0;
                    },
                  ),
                  horizontalGap(20),
                  buildTapItem(
                    title: "P2P",
                    index: 1,
                    onTap: () {
                      context.read<NavProvider>().store = 1;
                    },
                  ),
                  const Spacer(),
                  SvgPicture.asset(Assets.assetsIconsSearch),
                  horizontalGap(25),
                  SvgPicture.asset(Assets.assetsIconsHeart),
                  horizontalGap(25),
                  SvgPicture.asset(Assets.assetsIconsCart),
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => verticalGap(),
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              items[i],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Spacer(),
                            const Text(
                              'MORE',
                              style: TextStyle(
                                color: Color(0xFF6D7177),
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_back_ios,
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                        verticalGap(30),
                        GridView.count(
                          crossAxisCount: 4,
                          childAspectRatio: 2 / 3,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            ...provider.model!.data!
                                .where((element) => element.type == items[i])
                                .toList()
                                .map((e) => buildItem(data: e))
                                .toList()
                          ],
                        ),
                      ],
                    );
                  }),
          
          
            ],
          ),
        );
      }),
    );
  }

  Widget buildTapItem({
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: provider.store == index
                    ? const Color(0xFF7A58FF)
                    : const Color(0xFF6D7177),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 14,
              height: 2,
              decoration: BoxDecoration(
                color: provider.store == index
                    ? const Color(0xFF7A58FF)
                    : Colors.transparent,
              ),
            )
          ],
        ),
      );
    });
  }

  Widget buildItem({required Asset data}) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const ProceedDialog(
            title: "Proceed Buy",
            subtitle: "Continue",
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: data.image!,
              fit: BoxFit.cover,
              width: 55,
              height: 55,
            ),
          ),
          Text(
            data.title!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF6D7177),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            '৹${data.value}',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }


}
