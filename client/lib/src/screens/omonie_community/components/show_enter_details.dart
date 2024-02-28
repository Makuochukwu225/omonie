import 'package:omonie/src/src.dart';

class ShowEnterDetails {
  show({
    required BuildContext context,
    required Map<String, dynamic> data,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnterDetails(
        data: data,
      ),
    );
  }
}

class EnterDetails extends StatefulWidget {
  final Map<String, dynamic> data;
  const EnterDetails({Key? key, required this.data}) : super(key: key);

  @override
  State<EnterDetails> createState() => _EnterDetailsState();
}

class _EnterDetailsState extends State<EnterDetails> {
  int index = -1;
  File? image;
  var titleEdt = TextEditingController();
  var contentEdt = TextEditingController();
  bool get canContinue =>
      image != null && titleEdt.text.isNotEmpty && contentEdt.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    titleEdt.addListener(updateCanContinue);
    contentEdt.addListener(updateCanContinue);
  }

  void updateCanContinue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                const Spacer(),
                InkWell(
                  onTap: !canContinue
                      ? null
                      : () {
                          widget.data.addAll({"title": titleEdt.text});
                          widget.data.addAll({"content": contentEdt.text});
                          widget.data.addAll({"image": image});
                          pop(context);
                          ShowEnterTag()
                              .show(context: context, data: widget.data);
                        },
                  child: Text(
                    'FINISH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          !canContinue ? const Color(0xFF6D7177) : Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: titleEdt,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: UnderlineInputBorder(),
                  ),
                ),
                Builder(builder: (context) {
                  if (image == null) {
                    return const SizedBox();
                  }
                  return SizedBox(
                    height: 250,
                    child: Stack(
                      children: [
                        Image.file(image!),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                image = null;
                              });
                            },
                            icon: const Icon(Icons.close),
                          ),
                        )
                      ],
                    ),
                  );
                }),
                TextField(
                  minLines: 2,
                  maxLines: 3,
                  controller: contentEdt,
                  decoration: InputDecoration(
                    hintText: "Content",
                    suffix: IconButton(
                      onPressed: () {
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
                      icon: const Icon(Icons.image),
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
