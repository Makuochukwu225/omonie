import 'package:omonie/src/src.dart';

class AssetProvider extends ChangeNotifier {
  AssetModel? _model;
  AssetModel? get model => _model;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  Asset? _avatar;
  Asset? get avatar => _avatar;

  set avatar(Asset? value) {
    _avatar = value;
    notifyListeners();
  }

  fetchAvatars() {
    _isLoading = true;
    notifyListeners();
    AssetService().fetchAssets().then((value) {
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
