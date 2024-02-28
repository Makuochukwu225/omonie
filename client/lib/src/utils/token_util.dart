import 'package:omonie/src/src.dart';

class TokenUtil {
  static Future persistToken({
    required String token,
  }) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
    log('Saved token: $token');
  }

  static Future clearToken() async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    log('Token Cleared');
  }

  static Future<String?> retrieveToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    log('Retrieve token: $token');
    return token;
  }

  static Future<bool> checkToken() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString('token');
    log('Check token: $token');
    if (token == null) {
      return true;
    }
    try {
      return JwtDecoder.isExpired(token);
    } on Exception catch (_) {
      return true;
    }
  }
}
