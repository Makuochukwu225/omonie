import 'package:omonie/src/src.dart';

class AppMessage {
  static showMessage({
    required String message,
  }) {
    ScaffoldMessenger.of(navKey.currentState!.context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
