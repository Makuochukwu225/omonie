import 'package:omonie/src/src.dart';

class PostProvider with LoggingMixin, ChangeNotifier {
  PostService service = PostService();
  PostModel? _userModel;
  PostModel? get userModel => _userModel;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _hasData = false;
  bool get hasData => _hasData;

  String _message = "";
  String get message => _message;

  final List<Post> _list = [];
  List<Post> get list => _list;

  fetchPost({int? page, int? limit}) async {
    _isLoading = true;
    notifyListeners();
    try {
      var result = await service.fetchPost(
        page: page,
        limit: limit,
      );
      _userModel = result;
      _isLoading = false;
      _hasData = true;
      _message = result.message!;
      list.addAll(result.data!);
      notifyListeners();
    } on Exception catch (e) {
      _isLoading = false;
      _hasData = false;
      _message = e.toString();
      notifyListeners();
    }
  }
}
