import 'package:omonie/src/src.dart';

class BuildInvestmentWalletWidget extends StatelessWidget {
  const BuildInvestmentWalletWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 25,
        bottom: 25,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSummary(),
          verticalGap(15),
          buildBalance(),
          verticalGap(30),
          buildReturnWidget(),
        ],
      ),
    );
  }

  Widget buildReturnWidget() {
    return const Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ROI',
                style: TextStyle(
                  color: Color(0xFF6D7177),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'N1,000,000',
                style: TextStyle(
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
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Packages',
                style: TextStyle(
                  color: Color(0xFF6D7177),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '2',
                style: TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildBalance() => Row(
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'N',
                style: TextStyle(
                  color: Color(0xFF6D7177),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                '500,055',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                '.67',
                style: TextStyle(
                  color: Color(0xFF6D7177),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '+N50k',
            style: TextStyle(
              color: Color(0xFF14DA63),
              fontSize: 10,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          Container(
            width: 54,
            height: 22,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF282D35),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '30 DAYS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      );

  Widget buildSummary() => Row(
        children: [
          const Text(
            'Summary',
            style: TextStyle(
              color: Color(0xFF6D7177),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          horizontalGap(5),
          SvgPicture.asset(Assets.assetsIconsEye),
          const Spacer(),
          SvgPicture.asset(Assets.assetsIconsHistory),
          horizontalGap(5),
          const Text(
            'Show History',
            style: TextStyle(
              color: Color(0xFF6D7177),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          )
        ],
      );
}
