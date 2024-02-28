import 'package:omonie/src/src.dart';

class OmonieInvestmentScreen extends StatelessWidget {
  const OmonieInvestmentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const BuildInvestmentWalletWidget(),
            verticalGap(30),
            carouselItem(),
            verticalGap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                carouselIndicator(),
                horizontalGap(10),
                carousel2Indicator(),
                horizontalGap(10),
                carousel2Indicator(),
              ],
            ),
            verticalGap(30),
            newInvestmentButton(),
            verticalGap(30),
            const BuildPortfolio(),
            verticalGap(30),
            buildDoingGreatWidget(),
            verticalGap(30),
          ],
        ),
      ),
    );
  }

  Container buildDoingGreatWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.assetsIconsLeaf),
          const SizedBox(height: 10),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'You are doing Great. ',
                  style: TextStyle(
                    color: Color(0xFFBABDC2),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'Keep Investing',
                  style: TextStyle(
                    color: Color(0xFF14DA63),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget newInvestmentButton() => Container(
        width: double.infinity,
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0xFF7A58FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'NEW INVESTMENT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      );

  Widget carouselIndicator() => Container(
        width: 9,
        height: 9,
        decoration: const ShapeDecoration(
          color: Color(0xFF6D7177),
          shape: OvalBorder(),
        ),
      );
  Widget carousel2Indicator() => Container(
        width: 9,
        height: 9,
        decoration: const ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(width: 1, color: Color(0xFF33383F)),
          ),
        ),
      );

  Widget carouselItem() => Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF1F2226)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.50,
                child: Text(
                  '3x',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Color(0xFF1F2226),
                    fontSize: 103,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'JOIN THE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Tripple X Challenge',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Gather free Boosters and multiply your Investment Returns!',
                  style: TextStyle(
                    color: Colors.white,
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
      );
}
