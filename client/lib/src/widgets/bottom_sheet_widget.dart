import 'package:omonie/src/src.dart';

class BottomSheetWidget extends StatefulWidget {
  final Widget? bottomSheet;
  final Widget? header;
  final Widget? body;
  const BottomSheetWidget({
    Key? key,
    this.bottomSheet,
    this.header,
    this.body,
  }) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomSheet: widget.bottomSheet,
        body: Column(
          children: [
            const BuildHandle(),
            widget.header ?? const SizedBox(),
            Expanded(
              child: widget.body ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
