import 'package:omonie/src/src.dart';

class BuildCoverImage extends StatefulWidget {
  const BuildCoverImage({Key? key}) : super(key: key);

  @override
  State<BuildCoverImage> createState() => _BuildCoverImageState();
}

class _BuildCoverImageState extends State<BuildCoverImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(
        right: 20,
        left: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Gif(
        height: 86,
        width: double.infinity,
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
}
