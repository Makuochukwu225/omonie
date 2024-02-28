import 'package:omonie/src/src.dart';

class ShowSearchUserWidget extends StatefulWidget {
  const ShowSearchUserWidget({Key? key}) : super(key: key);

  @override
  State<ShowSearchUserWidget> createState() => _ShowSearchUserWidgetState();
}

class _ShowSearchUserWidgetState extends State<ShowSearchUserWidget> {
  @override
  void initState() {
    super.initState();
  }

  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, provider, _) {
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
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Send Nuts',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text(
                                        '৹',
                                        style: TextStyle(
                                          color: Color(0xFF6D7177),
                                          fontSize: 24,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '${provider.userModel!.data!.availableNut!}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 32,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const Text(
                                        '.00',
                                        style: TextStyle(
                                          color: Color(0xFF6D7177),
                                          fontSize: 18,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'N17500',
                                style: TextStyle(
                                  color: Color(0xFF6D7177),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      verticalGap(40),
                      const Text(
                        'Insert Recipient’s username',
                        style: TextStyle(
                          color: Color(0xFFBABDC2),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalGap(15),
                      AppInput(
                        controller: controller,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            provider.searchUser(userName: value);
                          }
                        },
                      ),
                      verticalGap(15),
                      Builder(builder: (context) {
                        if (provider.hasSearchData) {
                          var list = provider.userSearchModel!.data!;
                          return GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(10),
                            itemCount: list.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 2 / 3.9,
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) =>
                                item(data: list[index]),
                          );
                        }
                        return const SizedBox();
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget item({required UserData data}) => Container(
        padding: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
          bottom: 25,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF282D35)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
                  CachedNetworkImage(
                    width: 109,
                    height: 75,
                    // imageUrl: "",
                    imageUrl: data.avatar!.image!,
                    errorWidget: (context, url, error) =>
                        Image.asset(Assets.assetsImagesOmonie),
                    placeholder: (context, url) =>
                        Image.asset(Assets.assetsImagesOmonie),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.firstName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                pop(context);
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => EnterNutWidget(data: data));
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 40,
                height: 40,
                decoration: const ShapeDecoration(
                  color: Color(0xFF7A58FF),
                  shape: OvalBorder(),
                ),
                child: const Center(
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildItem({required UserData data}) => Container(
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
              imageUrl: data.avatar!.image!,
              errorWidget: (context, url, error) =>
                  Image.asset(Assets.assetsImagesOmonie),
              placeholder: (context, url) =>
                  Image.asset(Assets.assetsImagesOmonie),
            ),
            const SizedBox(height: 15),
            Text(
              '৹${data.firstName}',
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
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: double.infinity,
                height: 30,
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
