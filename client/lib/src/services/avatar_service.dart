import 'package:omonie/src/src.dart';

class AvatarService {
  static Future<AvatarModel> fetchAvatars() async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.get,
      url: "$baseUrl/avatar/fetch-avatars",
    );
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return AvatarModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }
}
