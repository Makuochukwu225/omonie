import 'package:omonie/src/src.dart';

class NutProvider extends ChangeNotifier {
  NutModel? _model;
  NutModel? get model => _model;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  Nut? _avatar;
  Nut? get avatar => _avatar;

  set avatar(Nut? value) {
    _avatar = value;
    notifyListeners();
  }

  fetchNuts() {
    _isLoading = true;
    notifyListeners();
    NutService().fetchAssets().then((value) {
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
