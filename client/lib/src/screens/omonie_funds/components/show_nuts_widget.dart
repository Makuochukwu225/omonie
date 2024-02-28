import 'package:omonie/src/src.dart';

class ShowNutsWidget extends StatefulWidget {
  const ShowNutsWidget({Key? key}) : super(key: key);

  @override
  State<ShowNutsWidget> createState() => _ShowNutsWidgetState();
}

class _ShowNutsWidgetState extends State<ShowNutsWidget> {
  @override
  void initState() {
    super.initState();
  }

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NutProvider>(builder: (context, provider, _) {
      return Container(
        padding: const EdgeInsets.only(
          top: 10,
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const BuildHandle(),
              SizedBox(
                height: 38,
                width: double.infinity,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 10,
                      bottom: 10,
                      child: Text(
                        'Buy Nuts',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        onPressed: () {
                          pop(context);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF33383F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              verticalGap(),
              Builder(builder: (context) {
                if (provider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!provider.hasData) {
                  return const SizedBox();
                }
                var list = provider.model!.data!;
                return GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3.9,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => buildItem(data: list[index]),
                );
              })
            ],
          ),
        ),
      );
    });
  }

  Widget buildItem({required Nut data}) => Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: const Color(0xFF1F2226),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF282D35)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              width: 109,
              height: 75,
              // imageUrl: "",
              imageUrl: data.image!,
              errorWidget: (context, url, error) =>
                  Image.asset(Assets.assetsImagesOmonie),
              placeholder: (context, url) =>
                  Image.asset(Assets.assetsImagesOmonie),
            ),
            const SizedBox(height: 15),
            Text(
              '৹${data.nutValue}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFFFEB3D),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'N',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6D7177),
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                const SizedBox(width: 2),
                Text(
                  "${data.nairaValue}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => ShowNutSummaryWidget(data: data));
              },
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: double.infinity,
                // height: 30,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF14DA63),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BUY',
                      style: TextStyle(
                        color: Color(0xFF0B0D0E),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
