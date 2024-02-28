import 'package:omonie/src/src.dart';

class MoreSheet extends StatelessWidget {
  const MoreSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
            onTap: () {
              push(context, const OmonieAdminScreen());
            },
            child: const Text("Admin")),
      ],
    );
  }
}
