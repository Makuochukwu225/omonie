import 'package:omonie/src/src.dart';

class OmonieCommunityScreen extends StatelessWidget {
  const OmonieCommunityScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const BuildSubscribeWidget(),
            verticalGap(10),
            const BuildSearch(),
            const BuildPostList()
          ],
        ),
      ),
    );
  }
}
