import 'package:omonie/src/src.dart';

class PostService {
  Future<PostModel> fetchPost({int? page = 1, int? limit = 10}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.get,
        url: "$baseUrl/post/posts/?page=$page&limit=$limit",
        token: "${await TokenUtil.retrieveToken()}");
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return PostModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }

  Future<dynamic> createPost({required Map<String, dynamic> data}) async {
    print(data);
    var image = await ImageService.uploadFile(files: data["image"]);
    if (image == null) {
      throw "failed uploading image";
    }

    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.post,
        url: "$baseUrl/post/posts",
        body: jsonEncode({
          "image": image.secureUrl,
          "title": data["title"],
          "description": data["content"],
          "type": data['type'],
          "tags": data["tag"]
        }),
        token: "${await TokenUtil.retrieveToken()}");
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return json;
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }
}
