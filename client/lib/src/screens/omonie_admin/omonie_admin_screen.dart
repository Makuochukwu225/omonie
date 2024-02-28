import 'package:omonie/src/src.dart';

class OmonieAdminScreen extends StatefulWidget {
  const OmonieAdminScreen({Key? key}) : super(key: key);

  @override
  State<OmonieAdminScreen> createState() => _OmonieAdminScreenState();
}

class _OmonieAdminScreenState extends State<OmonieAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Image.asset(Assets.assetsImagesOmonie),
          ),
          buildHeader(),
          const Divider(),
          verticalGap(20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Manage Content',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  verticalGap(15),
                  Row(
                    children: [
                      Expanded(child: item()),
                      horizontalGap(15),
                      const Expanded(child: SizedBox()),
                      horizontalGap(15),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget item() => InkWell(
        onTap: () {
          push(context, const OmonieAssetScreen());
        },
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 122.67,
          height: 99,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Store',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(height: 10),
              SvgPicture.asset(Assets.assetsIconsStore2),
            ],
          ),
        ),
      );

  Widget buildHeader() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Row(
          children: [
            Container(
              width: 134.60,
              height: 63.10,
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.50, vertical: 5),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 52.44,
                    height: 51.78,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/52x52"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7.50),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Soldier',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(height: 2.50),
                      Text(
                        'Developer',
                        style: TextStyle(
                          color: Color(0xFF807777),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 95,
                height: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 7.5,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF1F2226),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.60,
                      child: Text(
                        'LOG OUT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
