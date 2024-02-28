





import 'package:omonie/src/src.dart';

class PrefUtil {
  static Future saveonBoarding({required bool isFirstTime}) async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool("isFirstTime", isFirstTime);
  }

  static Future<bool> retrieveOnboarding() async {
    var pref = await SharedPreferences.getInstance();
    var isFirstTime = pref.getBool("isFirstTime");
    return isFirstTime ?? true;
  }

  static Future saveLoginUser({required String token}) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("loginUser", token).then((value) {
      log('UserType saved: $token');
    });
  }

  static Future savesUserId({required String userId}) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("schoolId", userId).then((value) {
      log('schoolId saved: $userId');
    });
  }

  static Future<String?> retrieveLoginUser() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString("loginUser");
    log('UserType retrieved: $token');
    return token;
  }

  static Future<String?> retrieveschoolId() async {
    var pref = await SharedPreferences.getInstance();
    var token = pref.getString("schoolId");
    log('schoolId retrieved: $token');
    return token;
  }
}
