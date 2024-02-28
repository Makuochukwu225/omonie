import 'dart:io';

import 'package:omonie/src/src.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
    //   var data = context.read<AvatarProvider>();
    //   if (data.hasData) {
    //     data.avatar = data.model!.data!.first;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: Platform.isWindows
              ? () {
                  Navigator.pop(context);
                }
              : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalGap(100),
              Text(
                'Welcome to Omonie, ${context.read<AuthProvider>().data["firstName"]}.',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalGap(7),
              const Text(
                'We will not share your real name or any real information\nof yours. But you can choose how you will appear.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalGap(90),
              const Text(
                'Choose an avatar that bests\nrepresents you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalGap(10),
              Consumer<AvatarProvider>(
                builder: (context, provider, _) {
                  if (!provider.hasData) {
                    return const SizedBox();
                  }
                  return Wrap(
                    spacing: 16,
                    children: [
                      ...provider.model!.data!
                          .map(
                            (e) => buildAvatarTile(e: e, provider: provider),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
              verticalGap(30),
              AppButton(
                width: 182,
                data: "CONTINUE",
                onPressed: context.read<AvatarProvider>().avatar == null
                    ? null
                    : () {
                        var b = context.read<AuthProvider>().data;
                        var data = context.read<AvatarProvider>();
                        context.read<AuthProvider>().data = b
                          ..addAll({
                            "avatar": data.avatar!.id!,
                          });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IntentionScreen(),
                            ));
                      },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatarTile({
    required Avatar e,
    required AvatarProvider provider,
  }) {
    return InkWell(
      onTap: () {
        provider.avatar = e;
        setState(() {});
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFE9BB38),
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(e.image!),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                e.title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              horizontalGap(),
              provider.avatar == null
                  ? SvgPicture.asset(Assets.assetsIconsCheck)
                  : e.id == provider.avatar!.id
                      ? SvgPicture.asset(Assets.assetsIconsChecked)
                      : SvgPicture.asset(Assets.assetsIconsCheck)
            ],
          ),
        ],
      ),
    );
  }
}
