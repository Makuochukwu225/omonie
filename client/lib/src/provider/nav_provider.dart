import 'package:omonie/src/src.dart';

class NavProvider extends ChangeNotifier {
  PageController controller = PageController();
  PageController passwordController = PageController();
  PageController emailController = PageController();
  int _index = 0;
  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }

  var pages = <Widget>[
    const OmonieGamesScreen(),
    const OmonieCommunityScreen(),
    const OmonieStoreScreen(),
    const OmonieInvestmentScreen(),
    const OmonieFundsScreen(),
  ];

  int _tab = 0;
  int get tab => _tab;

  set tab(int value) {
    _tab = value;
    notifyListeners();
  }

  int _gameTab = 0;
  int get gameTab => _gameTab;

  set gameTab(int value) {
    _gameTab = value;
    notifyListeners();
  }

  int _store = 0;
  int get store => _store;

  set store(int value) {
    _store = value;
    notifyListeners();
  }

  

    int _profile = 0;
  int get profile => _profile;

  set profile(int value) {
    _profile = value;
    notifyListeners();
  }


  


}
