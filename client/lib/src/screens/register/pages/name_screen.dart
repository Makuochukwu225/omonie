import 'package:omonie/src/src.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isFirstNameButtonEnabled = false;
  bool isLastNameButtonEnabled = false;
  var first = TextEditingController();
  var last = TextEditingController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalGap(40),
                const Text(
                  'Tell us your name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                verticalGap(18),
                const Text(
                  'First name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalGap(10),
                AppInput(
                  hintText: "hint",
                  controller: first,
                  onChanged: (value) {
                    setState(() {
                      isFirstNameButtonEnabled = value.isNotEmpty;
                    });
                  },
                ),
                verticalGap(25),
                const Text(
                  'Last name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalGap(10),
                AppInput(
                  hintText: "hint",
                  controller: last,
                  onChanged: (value) {
                    setState(() {
                      isLastNameButtonEnabled = value.isNotEmpty;
                    });
                  },
                ),
                verticalGap(100),
                AppButton(
                    width: 190,
                    data: "Next",
                    onPressed:
                        (isFirstNameButtonEnabled && isLastNameButtonEnabled)
                            ? () {
                                context.read<AuthProvider>().data = {
                                  "firstName": first.text,
                                  "lastName": last.text,
                                   "location": "7091",
                                };
                                context.read<NavProvider>().controller.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut);
                              }
                            : null),
                verticalGap(75),
                const BuildSocialLoginWidget()
              ],
            ),
          ),
        ),
        const BuildCreateAccountText(),
      ],
    );
  }


  
}
