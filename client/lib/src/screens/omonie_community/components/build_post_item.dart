import 'package:omonie/src/src.dart';
import 'package:timeago/timeago.dart' as timeago;

class BuildPostItem extends StatelessWidget {
  final Post data;

  const BuildPostItem({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 188,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: const Color(0xFF1F2226),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 24,
                  height: 24,
                  imageUrl: data.user!.avatar != null
                      ? data.user!.avatar!.image!
                      : "",
                  placeholder: (context, url) => const Icon(Icons.person),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.person),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.user!.firstName!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: 19,
                    height: 19,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF2CB362),
                      shape: StarBorder.polygon(
                        rotation: 180,
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Color(0xFF1F2226),
                        ),
                        sides: 5,
                      ),
                    ),
                    child: const Text(
                      '1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'League Gothic',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 2.5),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1F2226),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF33383F)),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Follow',
                      style: TextStyle(
                        color: Color(0xFFFFB13D),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                timeago.format(DateTime.parse(data.createdAt!)),
                style: const TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.more_horiz),
            ],
          ),
          verticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 105,
                  height: 100,
                  imageUrl: data.image!,
                  placeholder: (context, url) => Image.asset(
                      width: 105, height: 100, Assets.assetsImagesOmonie),
                  errorWidget: (context, url, error) => Image.asset(
                      width: 105, height: 100, Assets.assetsImagesOmonie),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title!,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      data.description!,
                      maxLines: 2,
                      style: const TextStyle(
                        color: Color(0xFFBABDC2),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalGap(),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.assetsIconsLike),
              const SizedBox(width: 5),
              const Text(
                '1.3k',
                style: TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const SizedBox(width: 10),
              SvgPicture.asset(Assets.assetsIconsChat),
              const SizedBox(width: 5),
              const Text(
                '38k',
                style: TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              const Spacer(),
              SvgPicture.asset(Assets.assetsIconsInvestment)
            ],
          ),
        ],
      ),
    );
  }
}
