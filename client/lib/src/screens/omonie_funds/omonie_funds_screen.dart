import 'package:omonie/src/src.dart';

class OmonieFundsScreen extends StatelessWidget {
  const OmonieFundsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => context.read<UserProvider>().fetchUser(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BuildNairaWidget(),
              verticalGap(30),
              const BuildNutWidget(),
              verticalGap(30),
              const BuildTransactionListWidget(),
              verticalGap(100),
            ],
          ),
        ),
      ),
    );
  }
}
