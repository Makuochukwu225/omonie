import 'package:omonie/src/src.dart';

class BuildProfileDetail extends StatelessWidget {
  const BuildProfileDetail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      child: Row(
        children: [
          buildAvatar(),
          buildName(),
          horizontalGap(50),
          buildLevelAvatar(),
        ],
      ),
    );
  }

  Widget buildLevelAvatar() {
    return Expanded(
      child: Gif(
        height: 75,
        fit: BoxFit.cover,
        duration: const Duration(seconds: 20),
        autostart: Autostart.loop,
        placeholder: (context) =>
            const Center(child: CircularProgressIndicator()),
        image: const NetworkImage(
            'https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp'),
      ),
    );
  }

  Widget buildAvatar() => SizedBox(
        height: 67,
        width: 67,
        child: Consumer<UserProvider>(
          builder: (context, provider, _) {
            if (provider.hasData &&
                !provider.isLoading &&
                provider.userModel?.data?.avatar?.image != null) {
              return CircleAvatar(
                onBackgroundImageError: (exception, stackTrace) =>
                    const CircleAvatar(),
                backgroundImage: CachedNetworkImageProvider(
                    provider.userModel!.data!.avatar!.image!),
              );
            }
            return const CircleAvatar();
          },
        ),
      );

  Widget buildName() => Consumer<UserProvider>(
        builder: (context, provider, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Builder(builder: (context) {
                if (provider.hasData && !provider.isLoading) {
                  return Text(provider.userModel!.data!.userName!);
                }
                return const Text("");
              }),
              Row(
                children: [
                  buildusername(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  )
                ],
              )
            ],
          );
        },
      );

  Widget buildusername() => Consumer<UserProvider>(
        builder: (context, provider, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: ShapeDecoration(
              color: const Color(0xFFFFEB3D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  if (provider.hasData && !provider.isLoading) {
                    return Text(
                      "${provider.userModel!.data!.firstName!} ${provider.userModel!.data!.lastName!}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF0B0D0E),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    );
                  }
                  return Text(
                    "",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                    ),
                  );
                }),
              ],
            ),
          );
        },
      );
}
