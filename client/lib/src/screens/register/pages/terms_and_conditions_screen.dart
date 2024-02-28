import 'package:omonie/src/src.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}

class _TermAndConditionScreenState extends State<TermAndConditionScreen> {
  bool index = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalGap(50),
            Text(
              'Welcome to Omonie, ${context.read<AuthProvider>().data["firstName"]}.',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            verticalGap(7),
            const Text(
              'Before you proceed, please take a moment to read and agree to our Terms and Conditions.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBABDC2),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            verticalGap(40),
            Container(
              width: 386,
              height: 410,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              decoration: ShapeDecoration(
                color: const Color(0xFF1F2226),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF282D35)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 313,
                    child: Text(
                      'Omonie Terms and Policies',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 15,
                        right: 5,
                        bottom: 15,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF101214),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF282D35)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SizedBox(
                        width: 322,
                        height: 288,
                        child: ListView(
                          shrinkWrap: true,
                          children: const [
                            Text(
                              "Terms of Service and Policies for a Multipurpose Investment and Social Mobile App\n\n**1. Introduction**\n\nThese Terms of Service ('Terms') govern your access to and use of the [App Name] mobile application ('App'). By accessing or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, you may not use the App.\n\n**2. Definitions**\n\n* **Content:** Any information, data, text, graphics, links, photographs, audio, video, or other materials submitted, posted, or displayed by you or other users on the App.\n* **User:** Any individual or entity that accesses or uses the App.\n* **Services:** The investment-related tools, social features, and other functionalities offered through the App.\n\n**3. User Accounts**\n\nTo access certain features of the App, you may need to create an account. You are responsible for maintaining the confidentiality of your account information and password and for restricting access to your computer. You agree to accept responsibility for all activities that occur under your account.\n\n**4. Content and User Conduct**\n\nYou are solely responsible for the Content you submit, post, or display on the App. You may not submit, post, or display any Content that is:\n\n* Illegal, harmful, threatening, abusive, harassing, tortious, defamatory, vulgar, obscene, or invasive of another's privacy.\n* Infringes on any intellectual property rights of any third party.\n* Contains any advertising or promotional materials without our express written permission.\n* Impersonates any person or entity, or misrepresents your affiliation with any person or entity.\n* Contains viruses, malware, or other harmful code.\n\n**5. Investment Information and Risks**\n\nThe App provides information and tools related to investments. This information is intended for educational purposes only and should not be considered financial advice. You are solely responsible for making your own investment decisions and should consult with a qualified financial advisor before making any investments. The App does not guarantee the accuracy or completeness of any investment information and assumes no liability for any losses or damages you may incur as a result of your investment decisions.\n\n**6. Social Features**\n\nThe App may include features that allow you to interact with other users, such as forums, chat rooms, and messaging. You agree to use these features responsibly and in accordance with these Terms. You may not use these features to:\n\n* Harass, abuse, or threaten other users.\n* Share personal information of others without their consent.\n* Engage in hate speech or discrimination.\n* Promote illegal activities.\n\n**7. Intellectual Property**\n\nThe App and all of its content are protected by copyright, trademark, and other intellectual property laws. You may not use, modify, copy, distribute, or reproduce any of the App's content without our express written permission.\n\n**8. Third-Party Links and Services**\n\nThe App may contain links to websites or services operated by third parties. We are not responsible for the content or privacy practices of these third-party websites or services. You access and use these third-party websites or services at your own risk.\n\n**9. Disclaimer of Warranties**\n\nThe App is provided 'as is' and without warranty of any kind, express or implied. We disclaim all warranties, including, but not limited to, warranties of merchantability, fitness for a particular purpose, and non-infringement. We do not warrant that the App will be uninterrupted, secure, or error-free.\n\n**10. Limitation of Liability**\n\nIn no event shall we be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of or in connection with your use of the App.\n\n**11. Termination**\n\nWe may terminate your access to the App at any time, for any reason, or for no reason. We may also remove any Content from the App at any time.\n\n**12. Governing Law and Dispute Resolution**\n\nThese Terms shall be governed by and construed in accordance with the laws of [State/Country], without regard to its conflict of laws provisions. Any dispute arising out of or in connection with these Terms shall be resolved by binding arbitration in accordance with the rules of the American Arbitration Association.\n\n**13. Changes to the Terms**\n\nWe may revise these Terms at any time. The revised Terms will be effective immediately upon posting on the App. You are responsible for reviewing the Terms regularly. Your continued use of the App after the posting of revised Terms constitutes your acceptance of the revised Terms.\n\n**14. Contact Us**\n\nIf you have any questions about these Terms, please contact us at [email protected]\n\n**Additional Policies:**\n\nIn addition to the Terms of Service, you may also want to consider creating separate policies for your App on the following topics:\n\n* Privacy Policy: This policy should explain how you collect, use, and disclose user data",
                              style: TextStyle(
                                color: Color(0xFFBABDC2),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalGap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: index,
                  checkColor: const Color(0xFF6D7177),
                  activeColor: Colors.transparent,
                  onChanged: (value) {
                    setState(() {
                      index = value!;
                    });
                  },
                ),
                const Text(
                  'I accept the terms and policies',
                  style: TextStyle(
                    color: Color(0xFF6D7177),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            verticalGap(50),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  ],
                ),
                AppButton(
                  width: 190,
                  data: "CONTINUE",
                  onPressed: !index
                      ? null
                      : () {
                          createAccount();
                        },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  createAccount() {
    var data2 = context.read<AuthProvider>().data;
    AppDialog.showProcessingDialog(context: context);
    AuthService.createAccount(data: data2).then((value) {
      AppDialog.cancelDialog(context);
      push(context, const RewardScreen());
    }).onError((error, stackTrace) {
      AppDialog.cancelDialog(context);
      AppMessage.showMessage(message: error.toString());
    });
  }
}
