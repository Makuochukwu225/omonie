import 'package:omonie/src/src.dart';

class NutService {
  Future<NutModel> fetchAssets({int? page = 1, int? limit = 10}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.get,
        url: "$baseUrl/nut/fetch-nuts/",
        token: "${await TokenUtil.retrieveToken()}");
    return await NetworkHelper.filterResponse(
        callBack: (json) {
          return NutModel.fromJson(json);
        },
        response: response,
        parameterName: CallBackParameterName.all,
        onFailureCallBackWithMessage: (errorType, msg) {
          throw msg!;
        });
  }

  Future<dynamic> createAsset({required Map<String, dynamic> data}) async {
    var image = await ImageService.uploadFile(files: data["image"]);
    if (image == null) {
      throw "failed uploading image";
    }

    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.post,
        url: "$baseUrl/asset/create-asset",
        body: jsonEncode({
          "image": image.secureUrl,
          "title": data["title"],
          "type": data["type"],
          "description": data['description'],
          "value": data['value']
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

  Future<dynamic> updateAsset({required Map<String, dynamic> data}) async {
    CloudinaryUploadModel? image;
    print(data['image'].runtimeType);
    if (data['image'].runtimeType != String) {
      image = await ImageService.uploadFile(files: data["image"]);
    }

    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.patch,
        url: "$baseUrl/asset/update-asset/${data["id"]}",
        body: jsonEncode({
          "image": image == null ? data['image'] : image.secureUrl,
          "title": data["title"],
          "type": data["type"],
          "description": data['description'],
          "value": data['value']
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

  Future<dynamic> deleteAsset({required String assetId}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.delete,
        url: "$baseUrl/asset/delete-asset/$assetId",
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

  Future<dynamic> buyNut({required String nutId}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.put,
        url: "$baseUrl/nut/purchase-nut/$nutId",
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

  Future<dynamic> transferNut(
      {required String userId, required int nut}) async {
    final response = await NetworkService.sendRequest(
        requestType: RequestTypes.put,
        url: "$baseUrl/nut/transfer-nut/$userId",
        body: jsonEncode({"nut": nut}),
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
