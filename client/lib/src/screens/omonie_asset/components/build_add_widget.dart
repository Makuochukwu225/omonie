import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

class BuildAddWidget extends StatefulWidget {
  const BuildAddWidget({Key? key}) : super(key: key);

  @override
  State<BuildAddWidget> createState() => _BuildAddWidgetState();
}

class _BuildAddWidgetState extends State<BuildAddWidget> {
  var value = TextEditingController();
  var title = TextEditingController();
  final Map<String, dynamic> data = {};
  File? image;
  int page = 1;
  var description = TextEditingController();
  final List<String> items = [
    'Avatar',
    'Award',
    'Badge',
    'Frame',
    'Game Booster',
    'Sticker',
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    value.addListener(textListiner);
    title.addListener(textListiner);
    description.addListener(textListiner);
  }

  void textListiner() {
    setState(() {});
  }

  bool get canContinue =>
      title.text.isNotEmpty &&
      description.text.isNotEmpty &&
      value.text.isNotEmpty &&
      selectedValue != null;

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const BuildHandle(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    left: 0,
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
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        'New Assets',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalGap(60),
                    page == 1
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Type of Asset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              verticalGap(10),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).hintColor,
                                    ),
                                  ),
                                  items: items
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF6D7177),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValue,
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedValue = value;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF282D35)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                              verticalGap(25),
                              const Text(
                                'Title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              verticalGap(10),
                              AppInput(
                                controller: title,
                              ),
                              verticalGap(25),
                              const Text(
                                'Description',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              verticalGap(10),
                              AppInput(
                                controller: description,
                              ),
                              verticalGap(25),
                              const Text(
                                'Value',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              verticalGap(10),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: const Color(0xFF282D35),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: subtract,
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        width: 54,
                                        child: const Icon(Icons.remove),
                                      ),
                                    ),
                                    Expanded(
                                      child: AppInput(
                                        controller: value,
                                        keyboardType: const TextInputType
                                            .numberWithOptions(),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                        onTap: add,
                                        child: Container(
                                            padding: const EdgeInsets.all(8),
                                            width: 54,
                                            child: const Icon(Icons.add))),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : buildImagePicker(),
                    verticalGap(page == 2 ? 24 : 100),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            bg: page == 2 ? const Color(0xFF1F2226) : null,
                            onPressed: !canContinue
                                ? null
                                : () {
                                    data.addAll({"type": selectedValue});
                                    data.addAll({"title": title.text});
                                    data.addAll(
                                        {"description": description.text});
                                    data.addAll({"value": value.text});
                                    setState(() {
                                      if (page == 1) {
                                        page = 2;
                                      } else {
                                        page = 1;
                                      }
                                    });
                                  },
                            data: page == 2 ? "Back" : "Next",
                          ),
                        ),
                        horizontalGap(),
                        Expanded(
                          child: page == 1
                              ? const SizedBox()
                              : AppButton(
                                  onPressed: image == null
                                      ? null
                                      : () {
                                          data.addAll({"image": image});
                                          AppDialog.showProcessingDialog(
                                              context: context);
                                          AssetService()
                                              .createAsset(data: data)
                                              .then((value) {
                                            AppDialog.cancelDialog(context);
                                            context
                                                .read<AssetProvider>()
                                                .fetchAvatars();
                                          }).onError((error, stackTrace) {
                                            AppDialog.cancelDialog(context);
                                          });
                                        },
                                  data: "Done",
                                ),
                        ),
                      ],
                    ),
                    verticalGap(100),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  add() {
    if (value.text.isEmpty) {
      var v = 0;
      v++;
      value.text = v.toString();
    } else {
      var v = int.parse(value.text);
      v++;
      value.text = v.toString();
    }
    setState(() {});
  }

  subtract() {
    if (value.text.isEmpty) {
      var v = 0;
      v--;
      value.text = v.toString();
    } else {
      var v = int.parse(value.text);
      if (v > 0) {
        v--;
      }

      value.text = v.toString();
    }
    setState(() {});
  }

  Widget buildImagePicker() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              FilePicker.platform
                  .pickFiles(
                type: FileType.image,
              )
                  .then((value) {
                if (value != null) {
                  setState(() {
                    image = File(value.paths.first!);
                  });
                }
              });
            },
            child: Container(
              height: 142,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFF0B0D0E),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFF282D35),
                  ),
                  borderRadius: BorderRadius.circular(5),
                  image: image == null
                      ? const DecorationImage(
                          image: AssetImage(Assets.assetsIconsImageThumbnail))
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(image!),
                        )),
            ),
          ),
          verticalGap(24),
          const Text(
            'UPLOAD THUMBNAIL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ],
      );
}
