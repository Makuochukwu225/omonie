import 'package:omonie/src/src.dart';

class SuccessPayment extends StatefulWidget {
  const SuccessPayment({Key? key}) : super(key: key);

  @override
  State<SuccessPayment> createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
  int index = -1;
  Map<String, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        // left: 30,
        // right: 30,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Color(0xFF0C0D0F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          const BuildHandle(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF33383F),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Spacer(),
          Image.asset(Assets.assetsImagesJar),
          const Text(
            'We are processing your payment.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Order confirmation can take up to 1 hour. Your account will be funded soon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          verticalGap(50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    pop(context);
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 400,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF7A58FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'return home'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalGap(50),
              ],
            ),
          )
        ],
      ),
    );
  }
}
