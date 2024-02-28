import 'package:omonie/src/src.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isFirstNameButtonEnabled = false;
  bool isLastNameButtonEnabled = false;
  var password = TextEditingController();
  var cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalGap(40),
          const Text(
            'Create a Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Text(
            'Secure your account with a strong password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalGap(18),
          const Text(
            'Create Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(10),
          AppInput(
            hintText: "hint",
            controller: password,
            onChanged: (value) {
              RegExp passwordRegExp =
                  RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
              setState(() {
                isFirstNameButtonEnabled =
                    value.isNotEmpty && passwordRegExp.hasMatch(value);
              });
            },
          ),
          verticalGap(),
          Builder(builder: (context) {
            if (password.text.length < 6 || isFirstNameButtonEnabled) {
              return const SizedBox();
            }
            return const Text(
                "Password must contain at least one uppercase character, one lowercase character, one number, one symbol and 8 characters long.");
          }),
          verticalGap(25),
          const Text(
            'Create Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          verticalGap(10),
          AppInput(
            hintText: "hint",
            controller: cpassword,
            onChanged: (value) {
              RegExp passwordRegExp =
                  RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

              setState(() {
                isLastNameButtonEnabled = value.isNotEmpty &&
                    passwordRegExp.hasMatch(value) &&
                    password.text == value;
              });
            },
          ),
          verticalGap(),
          Builder(builder: (context) {
            if (cpassword.text.length < 6 || isLastNameButtonEnabled) {
              return const SizedBox();
            }
            return const Text(
                "Password must contain at least one uppercase character, one lowercase character, one number, one symbol and 8 characters long.");
          }),
          verticalGap(100),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<NavProvider>().controller.previousPage(
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
              horizontalGap(15),
              AppButton(
                  width: 190,
                  data: "Next",
                  onPressed:
                      (isFirstNameButtonEnabled && isLastNameButtonEnabled)
                          ? () {
                              var b = context.read<AuthProvider>().data;
                              context.read<AuthProvider>().data = b
                                ..addAll({
                                  "password": password.text,
                                });
                              context.read<NavProvider>().controller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut);
                            }
                          : null),
            ],
          ),
          verticalGap(75),
        ],
      ),
    );
  }
}
