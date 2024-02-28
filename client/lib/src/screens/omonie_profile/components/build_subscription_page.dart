import 'package:omonie/src/src.dart';

class BuildSubscriptionPage extends StatefulWidget {
  const BuildSubscriptionPage({Key? key}) : super(key: key);

  @override
  State<BuildSubscriptionPage> createState() => _BuildSubscriptionPageState();
}

class _BuildSubscriptionPageState extends State<BuildSubscriptionPage> {
  bool isClosed = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalGap(10),
        Container(
          width: 396,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFFFB7AD),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'STAND OUT WITH PREMIUM',
                        style: TextStyle(
                          color: Color(0xFF0B0D0E),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Omonie BOSS!',
                        style: TextStyle(
                          color: Color(0xFF0B0D0E),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Explore all Premium Benefits',
                        style: TextStyle(
                          color: Color(0xFF0B0D0E),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '৹10/M',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF0B0D0E),
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        'NGN500',
                        style: TextStyle(
                          color: Color(0xFF0B0D0E),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isClosed
                  ? const SizedBox()
                  : Column(
                      children: [
                        verticalGap(15),
                        Container(
                          padding: const EdgeInsets.all(15),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF1F2226)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Benefits',
                                style: TextStyle(
                                  color: Color(0xFF0B0D0E),
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              Assets.assetsIconsCheck),
                                          const SizedBox(width: 5),
                                          const Text(
                                            'Profile Banner with 10 free banners',
                                            style: TextStyle(
                                              color: Color(0xFF0B0D0E),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          'Get a different look with a banner on your account page.',
                                          style: TextStyle(
                                            color: Color(0xFF0B0D0E),
                                            fontSize: 14,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 63,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  Assets.assetsIconsCheck),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Change Display name',
                                                style: TextStyle(
                                                  color: Color(0xFF0B0D0E),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'Change your Display name maximum of 3 times a month.',
                                            style: TextStyle(
                                              color: Color(0xFF0B0D0E),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 63,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  Assets.assetsIconsCheck),
                                              const SizedBox(width: 5),
                                              const Text(
                                                'Use Free Assets',
                                                style: TextStyle(
                                                  color: Color(0xFF0B0D0E),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            'With premium you can collect and use all free asset from the Store.',
                                            style: TextStyle(
                                              color: Color(0xFF0B0D0E),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        verticalGap(15),
                      ],
                    ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isClosed = !isClosed;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          isClosed ? 'MORE' : 'LESS',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF282D35),
                            fontSize: 10,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Icon(
                          isClosed
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    // height: 35,
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 15,
                      right: 15,
                      bottom: 5,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF0B0D0E),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'ACTIVE',
                          style: TextStyle(
                            color: Color(0xFFBABDC2),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalGap(20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Next Billing Date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '15, July. 2024',
                    style: TextStyle(
                      color: Color(0xFFDA0404),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalGap(30),
      ],
    );
  }
}
