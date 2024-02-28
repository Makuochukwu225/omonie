import 'package:omonie/src/src.dart';

class AuthService {
  static Future<bool> checkEmail({
    required String email,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/check-email",
      body: jsonEncode({"email": email}),
    );
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return json["exists"];
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }

  static Future<dynamic> sendOtp({
    required String email,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/send-otp",
      body: jsonEncode({"email": email}),
    );
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

  static Future<dynamic> verifyOtp({
    required String email,
    required String token,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.patch,
      url: "$baseUrl/user/verify-otp",
      body: jsonEncode({"email": email, "token": token}),
    );
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

  static Future<dynamic> createAccount({
    required Map<String, dynamic> data,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/register",
      body: jsonEncode(data),
    );
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

  static Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/login",
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return LoginModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }

  static Future<dynamic> sendPasswordOtp({
    required String email,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/password-reset",
      body: jsonEncode({"email": email}),
    );
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

  static Future<dynamic> verifyPasswordOtp({
    required String email,
    required String token,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.patch,
      url: "$baseUrl/user/password-verify-otp",
      body: jsonEncode({"email": email, "token": token}),
    );
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

  static Future<dynamic> setPasswordOtp({
    required String email,
    required String password,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.patch,
      url: "$baseUrl/user/password-reset",
      body: jsonEncode({"email": email, "password": password}),
    );
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

  static Future<CheckPhoneModel> checkPhone({
    required String phoneNumber,
  }) async {
    final response = await NetworkService.sendRequest(
      requestType: RequestTypes.post,
      url: "$baseUrl/user/check-phone",
      body: jsonEncode({"phoneNumber": phoneNumber}),
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
