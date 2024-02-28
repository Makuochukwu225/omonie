import 'package:flutter/cupertino.dart';
import 'package:omonie/src/src.dart';

class ForgetEmailScreen extends StatefulWidget {
  const ForgetEmailScreen({Key? key}) : super(key: key);

  @override
  State<ForgetEmailScreen> createState() => _ForgetEmailScreenState();
}

class _ForgetEmailScreenState extends State<ForgetEmailScreen> {
  int index = -1;
  var emailsController = TextEditingController();
  CountryCode? pick =
      const CountryCode(code: "NG", name: "Nigeria", dialCode: "+234");
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'Please provide the Phone number linked to your account. ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(38),
          const Text(
            'Enter your phone number',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(10),
          AppInput(
            controller: emailsController,
            prefix: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  const countryPicker = FlCountryCodePicker();

                  final picked = await countryPicker.showPicker(
                    context: context,
                    backgroundColor: bgColorDark,
                  );

                  if (picked != null) {
                    setState(() {
                      pick = picked;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        pick!.dialCode,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF6D7177),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SvgPicture.asset(Assets.assetsIconsArrowDown),
                    ],
                  ),
                ),
              ),
            ),
            onChanged: (p0) {
              setState(() {});
            },
          ),
          verticalGap(),
          isLoading ? const CupertinoActivityIndicator() : const SizedBox(),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
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
              horizontalGap(15),
              AppButton(
                data: "NEXT",
                width: 189,
                onPressed: (emailsController.text.isEmpty ||
                        emailsController.text.length < 9)
                    ? null
                    : () {
                        getOtp();
                      },
              ),
            ],
          )
        ],
      ),
    );
  }

  getOtp() {
    setState(() {
      isLoading = true;
    });
    AuthService.checkPhone(
            phoneNumber: "${pick!.dialCode}${emailsController.text}")
        .then((value) {
      context.read<AuthProvider>().phone =
          "${pick!.dialCode}${emailsController.text}";
      context.read<AuthProvider>().value = value;
      context.read<NavProvider>().emailController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
      AppMessage.showMessage(message: error.toString());
    });
  }
}
