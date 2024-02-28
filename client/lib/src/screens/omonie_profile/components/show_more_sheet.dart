import 'package:omonie/src/src.dart';

class ShowMoreSheet {
  show({required BuildContext context}) {
    showModalBottomSheet(
        context: context, builder: (context) => const MoreSheet());
  }
}
