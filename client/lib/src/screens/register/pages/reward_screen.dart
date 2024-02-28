import 'package:omonie/src/src.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        // onTap: () {
        //   Navigator.pop(context);
        // },
        child: Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalGap(50),
              const Text(
                'Congratulations on creating your account.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              verticalGap(14),
              const Text(
                'Please accept this Reward.\nWe wish you success as you remain an active member of Omonie community.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFBABDC2),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              verticalGap(60),
              Container(
                width: 168,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: const Color(0xFF1F2226),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(Assets.assetsImagesGift),
                    const SizedBox(height: 15),
                    const Text(
                      'Mystery Item',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFBABDC2),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 15),
                    AppButton(
                      data: "ACCEPT",
                      tc: accepted ? Colors.white : const Color(0xFF101214),
                      bg: accepted
                          ? const Color(0xFF282D35)
                          : const Color(0XFF15DA64),
                      width: 189,
                      onPressed: () {
                        setState(() {
                          accepted = !accepted;
                        });
                      },
                    )
                  ],
                ),
              ),
              verticalGap(50),
              AppButton(
                data: "FINISH",
                width: 189,
                onPressed: !accepted
                    ? null
                    : () {
                        pushRemoveAll(
                            context, const OmonieRegisterCompleteScreen());
                      },
              )
            ],
          ),
        ),
      ),
    );
  }
}
