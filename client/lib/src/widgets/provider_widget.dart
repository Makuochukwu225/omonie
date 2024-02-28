import 'package:omonie/src/src.dart';

class ProviderWidget extends StatelessWidget {
  final Widget child;
  const ProviderWidget({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RoomDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AvatarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AssetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PaystackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NutProvider(),
        ),
      ],
      child: KeyboardDismisser(
         gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
        child: child),
    );
  }
}
