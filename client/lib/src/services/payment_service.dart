import 'package:omonie/src/src.dart';

class PaymentService {
  static Future verifyOnServer({
    required String reference,
    required int amount
  }) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.post,
        url: "$baseUrl/paystack/verify/$reference",
        body: jsonEncode({
          "price": amount,
        }),
        token: "${await TokenUtil.retrieveToken()}");
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return (json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }
}
