import 'package:omonie/src/src.dart';


class OmonieHelpScreen extends StatefulWidget {
  const OmonieHelpScreen({Key? key}) : super(key: key);

  @override
  State<OmonieHelpScreen> createState() => _OmonieHelpScreenState();
}

class _OmonieHelpScreenState extends State<OmonieHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AuthHeader(
            title: "Can’t Login? Help is here.",
          ),
          Expanded(child: HelpIntroScreen())
        ],
      ),
    );
  }
}
