import 'dart:developer';

import 'package:omonie/src/src.dart';

class AuthProvider extends ChangeNotifier {
  bool? _isAvailable;
  bool? get isAvailable => _isAvailable;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isAvailable(bool? value) {
    _isAvailable = value;
    notifyListeners();
  }

  checkEMail(String email) {
    _isLoading = true;
    notifyListeners();
    AuthService.checkEmail(email: email).then((value) {
      _isAvailable = value;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _isLoading = false;
      _isAvailable = null;
      notifyListeners();
    });
  }

  reset() {
    _isAvailable = null;
    notifyListeners();
  }

  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  set data(Map<String, dynamic> value) {
    log('$value');
    _data = value;
    notifyListeners();
  }

  CheckPhoneModel? _value;
  CheckPhoneModel? get value => _value;

  set value(CheckPhoneModel? value) {
    _value = value;
    notifyListeners();
  }

  String? _phone;
  String? get phone => _phone;

  set phone(String? value) {
    _phone = value;
    notifyListeners();
  }
}
