import 'package:flutter/services.dart';
import 'package:omonie/src/src.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const ProviderWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Omonie',
        navigatorKey: navKey,
        theme: MyAppThemeConfig.dark().getTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}
