import 'package:omonie/src/src.dart';

class OmonieProfileScreen extends StatefulWidget {
  const OmonieProfileScreen({Key? key}) : super(key: key);

  @override
  State<OmonieProfileScreen> createState() => _OmonieProfileScreenState();
}

class _OmonieProfileScreenState extends State<OmonieProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            more: InkWell(
              onTap: () {
                ShowMoreSheet().show(context: context);
              },
              child: const Icon(
                Icons.more_vert,
                color: Color(0xFF6D7177),
              ),
            ),
          ),
          verticalGap(20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BuildCoverImage(),
                  verticalGap(),
                  const BuildProfileDetail(),
                  const BuildProperty(),
                  verticalGap(45),
                  const BuildProfileTab(),
                  verticalGap(25),
                  Consumer<NavProvider>(
                    builder: (context, userProfile, _) {
                      // Switch between widgets based on the userProfile.profile value
                      switch (userProfile.profile) {
                        case 0:
                          return const BuildAssetsPage();
                        case 1:
                          return const BuildInfoPage();
                        case 2:
                          return const BuildPreferencePage();
                        case 3:
                          return const BuildSubscriptionPage();

                        default:
                          return const SizedBox();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
