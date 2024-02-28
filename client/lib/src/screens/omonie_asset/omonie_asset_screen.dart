import 'package:flutter/cupertino.dart';
import 'package:omonie/src/screens/omonie_asset/components/build_edit_widget.dart';
import 'package:omonie/src/src.dart';

class OmonieAssetScreen extends StatefulWidget {
  const OmonieAssetScreen({Key? key}) : super(key: key);

  @override
  State<OmonieAssetScreen> createState() => _OmonieAssetScreenState();
}

class _OmonieAssetScreenState extends State<OmonieAssetScreen> {
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
      body: Column(
        children: [
          Center(
            child: Image.asset(Assets.assetsImagesOmonie),
          ),
          CustomAppbar(
            title: "Manage Content",
            more: InkWell(
              onTap: () {
                // ShowMoreSheet().show(context: context);
              },
              child: const Icon(
                Icons.more_vert,
                color: Color(0xFF6D7177),
              ),
            ),
          ),
          Expanded(
            child: Consumer<AssetProvider>(builder: (context, provider, _) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    verticalGap(40),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Assets',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${provider.model!.data!.length}',
                          style: const TextStyle(
                            color: Color(0xFF6D7177),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) => const BuildAddWidget(),
                            );
                          },
                          child: const Text(
                            'Create New Assets',
                            style: TextStyle(
                              color: Color(0xFF7A58FF),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalGap(15),
                    ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => verticalGap(),
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFF1F2226)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: Column(
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
                                        fontSize: 12,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      '(${provider.model!.data!.where((element) => element.type == items[i]).toList().length})',
                                      style: const TextStyle(
                                        color: Color(0xFF7A58FF),
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.more_horiz),
                                  ],
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => buildItem(
                                        data: provider.model!.data!
                                            .where((element) =>
                                                element.type == items[i])
                                            .toList()[index]),
                                    separatorBuilder: (context, index) =>
                                        verticalGap(),
                                    itemCount: provider.model!.data!
                                        .where((element) =>
                                            element.type == items[i])
                                        .toList()
                                        .length),
                              ],
                            ),
                          );
                        }),
                 
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  deleteAsset(String assetId) {
    AppDialog.showProcessingDialog(context: context);
    AssetService().deleteAsset(assetId: assetId).then((value) {
      context.read<AssetProvider>().fetchAvatars();
      AppDialog.cancelDialog(context);
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
    });
  }

  Widget buildItem({required Asset data}) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: ShapeDecoration(
          color: const Color(0xFF1F2226),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 69,
                    height: 77,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(data.image!),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            data.description!,
                            style: const TextStyle(
                              color: Color(0xFFBABDC2),
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '৹${data.value}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 13),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (context) =>  BuildEditWidget(data:data));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF191C20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.assetsIconsEdit),
                          const SizedBox(width: 10),
                          const Text(
                            'EDIT',
                            style: TextStyle(
                              color: Color(0xFFBABDC2),
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
                  horizontalGap(12),
                  InkWell(
                    onTap: () {
                      deleteAsset(data.id!);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF191C20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.assetsIconsDelete),
                          const SizedBox(width: 10),
                          const Text(
                            'REMOVE',
                            style: TextStyle(
                              color: Color(0xFFBABDC2),
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
            ),
          ],
        ),
      );
}
