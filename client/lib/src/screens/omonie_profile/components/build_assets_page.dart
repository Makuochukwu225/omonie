import 'package:omonie/src/src.dart';

class BuildAssetsPage extends StatefulWidget {
  const BuildAssetsPage({Key? key}) : super(key: key);

  @override
  State<BuildAssetsPage> createState() => _BuildAssetsPageState();
}

class _BuildAssetsPageState extends State<BuildAssetsPage> {
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
    return Consumer<AssetProvider>(
      builder: (context, provider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Builder(builder: (context) {
                if (provider.hasData) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => verticalGap(),
                      itemCount: items.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  items[i],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  ' (${provider.model!.data!.where((element) => element.type == items[i]).toList().length})',
                                  style: const TextStyle(
                                    color: Color(0xFF6D7177),
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  'MORE',
                                  style: TextStyle(
                                    color: Color(0xFF6D7177),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SvgPicture.asset(Assets.assetsIconsForward),
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
                                    .where(
                                        (element) => element.type == items[i])
                                    .toList()
                                    .map((e) => buildItem(data: e))
                                    .toList()
                              ],
                            ),
                          ],
                        );
                      });
                }

                return const SizedBox();
              }),
            ],
          ),
        );
      },
    );
  }

  Widget buildItem({required Asset data}) {
    return InkWell(
      onTap: () {},
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
