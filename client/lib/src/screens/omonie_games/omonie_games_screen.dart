import 'package:omonie/src/src.dart';

class OmonieGamesScreen extends StatelessWidget {
  const OmonieGamesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuildWalletWidget(),
            verticalGap(30),
            const BuildGameTab(),
            verticalGap(30),
            Consumer<NavProvider>(builder: (context, provider, _) {
              if (provider.tab == 0) {
                return const BuildPlaySoloWidget();
              }
              return const BuildPvpWidget();
            }),
            verticalGap(30),
            const BuildTopLeaderBoard(),
            verticalGap(30),
            const BuildLeardboardWidget(),
          ],
        ),
      ),
    );
  }
}
