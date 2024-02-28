import 'package:omonie/src/src.dart';

class BuildProfileTab extends StatelessWidget {
  const BuildProfileTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          buildTapItem(
            title: "Assets",
            index: 0,
            onTap: () {
              context.read<NavProvider>().profile = 0;
            },
          ),
          horizontalGap(24),
          buildTapItem(
            title: "Info",
            index: 1,
            onTap: () {
              context.read<NavProvider>().profile = 1;
            },
          ),
          horizontalGap(24),
          buildTapItem(
            title: "Preference",
            index: 2,
            onTap: () {
              context.read<NavProvider>().profile = 2;
            },
          ),
          horizontalGap(24),
          buildTapItem(
            title: "Subscription",
            index: 3,
            onTap: () {
              context.read<NavProvider>().profile = 3;
            },
          ),
        ],
      ),
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
                color: provider.profile == index
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
                color: provider.profile == index
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
