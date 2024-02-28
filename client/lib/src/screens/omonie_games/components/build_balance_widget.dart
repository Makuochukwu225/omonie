import 'package:omonie/src/src.dart';

class BuildWalletWidget extends StatelessWidget {
  const BuildWalletWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Game Wallet',
          style: TextStyle(
            color: const Color(0xFF6D7177),
            fontSize: 14,
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '৹',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: '3455',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '+2%',
                  style: TextStyle(
                    color: const Color(0xFF14DA63),
                    fontSize: 14,
                    fontFamily: GoogleFonts.inter().fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 28,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF282D35),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ' FUND ',
                    style: TextStyle(
                      color: const Color(0xFF14DA63),
                      fontSize: 10,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          'N570',
          style: TextStyle(
            color: const Color(0xFFBABDC2),
            fontSize: 14,
            fontFamily: GoogleFonts.inter().fontFamily,
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )
      ],
    );
  }
}
