import 'package:flutter/material.dart';
import 'package:omonie/src/widgets/gap.dart';

class BuildTransactionListWidget extends StatelessWidget {
  const BuildTransactionListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ACTIVITIES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        verticalGap(30),
        const Center(
          child: Text(
            'Today',
            style: TextStyle(
              color: Color(0xFF6D7177),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        buildActivitiesItem(
            title: "+FUND",
            subtitle: "Your account has been funded with N50,000.",
            date: "5:00pm"),
        verticalGap(15),
        buildActivitiesItem(
            title: "SEND",
            subtitle: "You sent N50,000 to 098348572 Eze Pamela",
            date: "7:59am"),
        verticalGap(5),
        const Center(
          child: Text(
            'Friday',
            style: TextStyle(
              color: Color(0xFF6D7177),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        verticalGap(15),
        buildActivitiesItem(
            title: "SWAP",
            subtitle: "You swapped N500 into ৹25",
            date: "7:59am"),
      ],
    );
  }

  Widget buildActivitiesItem({
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFF282D35)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(15),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFF6D7177),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '$subtitle ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                // const TextSpan(
                //   text: 'N50,000.',
                //   style: TextStyle(
                //     color: Color(0xFF14DA63),
                //     fontSize: 14,
                //     fontFamily: 'Inter',
                //     fontWeight: FontWeight.w700,
                //     height: 0,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
