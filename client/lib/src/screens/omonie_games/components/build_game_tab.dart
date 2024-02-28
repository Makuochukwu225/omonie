import 'package:omonie/src/src.dart';

class BuildGameTab extends StatelessWidget {
  const BuildGameTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'PLAY GAMES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        buildTapItem(
          title: "Play Solo",
          index: 0,
          onTap: () {
            context.read<NavProvider>().tab = 0;
          },
        ),
        horizontalGap(20),
        buildTapItem(
          title: "PvP",
          index: 1,
          onTap: () {
            context.read<NavProvider>().tab = 1;
          },
        ),
      ],
    );
  }

  Widget buildTapItem({
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    return Consumer<NavProvider>(builder: (context, provider, _) {
      return GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: provider.tab == index
                    ? const Color(0xFF7A58FF)
                    : const Color(0xFF6D7177),
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 14,
              height: 2,
              decoration: BoxDecoration(
                color: provider.tab == index
                    ? const Color(0xFF7A58FF)
                    : Colors.transparent,
              ),
            )
          ],
        ),
      );
    });
  }
}
