import 'package:omonie/src/src.dart';

class UserService {
  Future<UserModel> fetchUser() async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.get,
        url: "$baseUrl/user/my-user",
        token: "${await TokenUtil.retrieveToken()}");
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return UserModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }

  Future<CheckPhoneModel> checkUsername({
    required String userName,
  }) async {
    print(userName);
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/check-userName",
      body: jsonEncode({"userName": userName}),
    );
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return CheckPhoneModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }
}
