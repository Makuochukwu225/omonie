import 'package:omonie/src/src.dart';

class AvatarProvider extends ChangeNotifier {
  AvatarModel? _model;
  AvatarModel? get model => _model;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  Avatar? _avatar;
  Avatar? get avatar => _avatar;

  set avatar(Avatar? value) {
    print(value);
    _avatar = value;
    notifyListeners();
  }

  fetchAvatars() {
    _isLoading = true;
    notifyListeners();
    AvatarService.fetchAvatars().then((value) {
      _model = value;
      _hasData = true;
      _isLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      _hasData = false;
      _isLoading = false;
      _model = null;
      notifyListeners();
    });
  }
}
