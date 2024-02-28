import 'package:omonie/src/src.dart';

class ForgetEmail2Screen extends StatefulWidget {
  const ForgetEmail2Screen({Key? key}) : super(key: key);

  @override
  State<ForgetEmail2Screen> createState() => _ForgetEmail2ScreenState();
}

class _ForgetEmail2ScreenState extends State<ForgetEmail2Screen> {
  int index = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(12),
          InkWell(
            onTap: () {
              context.read<NavProvider>().emailController.previousPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut);
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF1F2226),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          verticalGap(20),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'We found ${context.read<AuthProvider>().value!.data!.length} account linked to this phone number ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '${context.read<AuthProvider>().phone}',
                  style: const TextStyle(
                    color: Color(0xFF7A58FF),
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          verticalGap(10),
          const Text(
            'check the email address for a hint of your email and try Login in again.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          verticalGap(40),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  ...context
                      .read<AuthProvider>()
                      .value!
                      .data!
                      .map(
                        (e) => Container(
                          width: 166,
                          padding: const EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                            bottom: 25,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF282D35)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: const Color(0xFFE9BB38),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(e.avatar!.image!),
                                  ),
                                ),
                              ),
                              verticalGap(5),
                              Text(
                                "${e.firstName!} ${e.lastName!} ",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              verticalGap(15),
                              const Text(
                                'Email address',
                                style: TextStyle(
                                  color: Color(0xFF7A58FF),
                                  fontSize: 10,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                maskEmail(e.email),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  pushReplace(
                                      context, const OmonieLoginScreen());
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xFF7A58FF),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      color: Colors.white,
                                      textDirection: TextDirection.rtl,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String maskEmail(String? email) {
    try {
      if (email == null || email.isEmpty) {
        return '';
      }

      int atIndex = email.indexOf('@');
      if (atIndex <= 4) {
        return '*' * atIndex + email.substring(atIndex);
      } else {
        String maskedFirstPart = email.substring(0, 4) + '*' * (atIndex - 4);
        return maskedFirstPart + email.substring(atIndex);
      }
    } catch (e) {
      print('Error masking email: $e');
      return email ?? "";
    }
  }

  Widget buildItem({
    required String title,
    required int index,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 289,
        height: 40,
        padding: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: index == this.index
                ? const BorderSide(width: 1, color: Color(0xFF14DA63))
                : const BorderSide(width: 1, color: Color(0xFF282D35)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
