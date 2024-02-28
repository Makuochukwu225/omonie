import 'package:omonie/src/src.dart';

class UserProvider with LoggingMixin, ChangeNotifier {
  UserService service = UserService();
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  String _message = "";
  String get message => _message;

  fetchUser() async {
    _isLoading = true;
    notifyListeners();
    try {
      var result = await service.fetchUser();
      _userModel = result;
      _isLoading = false;
      _hasData = true;
      _message = result.message!;
      notifyListeners();
    } on Exception catch (e) {
      _isLoading = false;
      _hasData = false;
      _message = e.toString();
      notifyListeners();
    }
  }

  CheckPhoneModel? _userSearchModel;
  CheckPhoneModel? get userSearchModel => _userSearchModel;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  bool _hasSearchData = false;
  bool get hasSearchData => _hasSearchData;

  String _message1 = "";
  String get message1 => _message1;

  searchUser({
    required String userName,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      var result = await service.checkUsername(userName: userName);
      _userSearchModel = result;
      _isSearching = false;
      _hasSearchData = true;
      _message1 = result.message!;
      notifyListeners();
    } on Exception catch (e) {
      _isSearching = false;
      _hasData = false;
      _message1 = e.toString();
      notifyListeners();
    }
  }

  reset() {
    _hasSearchData = false;
    _userSearchModel = null;
    notifyListeners();
  }
}
