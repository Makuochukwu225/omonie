import 'package:omonie/src/src.dart';

class ShowEnterTag {
  show({
    required BuildContext context,
    required Map<String, dynamic> data,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnterTag(
        data: data,
      ),
    );
  }
}

class EnterTag extends StatefulWidget {
  final Map<String, dynamic> data;
  const EnterTag({Key? key, required this.data}) : super(key: key);

  @override
  State<EnterTag> createState() => _EnterTagState();
}

class _EnterTagState extends State<EnterTag> {
  int index = -1;
  final List<String> values = [];
  onDelete(index) {
    setState(() {
      values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomSheet: Container(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AppButton(
                width: 190,
                data: "PREVIEW",
                onPressed: null,
              ),
              AppButton(
                width: 190,
                data: "POST",
                onPressed: values.length < 2
                    ? null
                    : () {
                        widget.data.addAll({"tag": values});
                        AppDialog.showProcessingDialog(context: context);
                        PostService().createPost(data:widget.data).then((value) {
                          context.read<PostProvider>().fetchPost();
                          AppDialog.cancelDialog(context);
                          pop(context);
                          ShowSuccessPost().show(context: context);
                        }).onError((error, stackTrace) {
                          pop(context);
                        });
                      },
              ),
            ],
          ),
        ),
        body: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF33383F),
                      ),
                    ),
                    const Text(
                      'FINISH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: const Text(
                        'CANCEL',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFBABDC2),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 96,
                          height: 92,
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 15,
                            right: 5,
                            bottom: 10,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                              color: const Color(0xFF1F2226),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: FileImage(widget.data["image"]))),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data["title"],
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.data["content"],
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalGap(10),
                    const Row(
                      children: [
                        Text(
                          'Add tags',
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
                    verticalGap(10),
                    TagEditor(
                      length: values.length,
                      delimiters: const [',', ' '],
                      hasAddButton: false,
                      inputDecoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'type',
                      ),
                      onTagChanged: (newValue) {
                        setState(() {
                          values.add(newValue);
                        });
                      },
                      tagBuilder: (context, index) => _Chip(
                        index: index,
                        label: values[index],
                        onDeleted: onDelete,
                      ),
                    ),
                    verticalGap(5),
                    const Row(
                      children: [
                        Text(
                          'Add at least 2 tags. Type and press enter to add more.',
                          style: TextStyle(
                            color: Color(0xFF6D7177),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
