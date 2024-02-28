import 'package:http/http.dart';
import 'package:omonie/src/src.dart';
import 'package:path/path.dart' as path;

class ImageService {
  static Future<List<CloudinaryUploadModel>> uploadFiles(
      {required List<File> files}) async {
    List<CloudinaryUploadModel> image = [];
    for (var i = 0; i < files.length; i++) {
      var request = MultipartRequest(
        'POST',
        Uri.parse('https://api.cloudinary.com/v1_1/dqw2p323o/image/upload'),
      );

      final file = await MultipartFile.fromPath(
        'file',
        files[i].path,
      );
      request.headers['Authorization'] =
          "Basic NzY4NDQ5ODIzMjkzODg3Ont7YXBpX3NlY3JldH19";
      request.files.add(file);
      request.fields['upload_preset'] = 'ml_default';
      request.fields['public_id'] = path.basename(files[i].path);
      request.fields['api_key'] = '768449823293887';
      try {
        final response = await request.send();
        var data = await response.stream.bytesToString();
        print(data);

        if (response.statusCode == 200) {
          image.add(CloudinaryUploadModel.fromJson(jsonDecode(data)));
        } else {
          throw Exception(response.reasonPhrase);
        }
      } catch (error) {
        throw Exception(error.toString());
      }
    }
    return image;
  }

  static Future<CloudinaryUploadModel?> uploadFile(
      {required File files}) async {
    var request = MultipartRequest(
      'POST',
      Uri.parse('https://api.cloudinary.com/v1_1/dqw2p323o/image/upload'),
    );

    final file = await MultipartFile.fromPath(
      'file',
      files.path,
    );
    request.headers['Authorization'] =
        "Basic NzY4NDQ5ODIzMjkzODg3Ont7YXBpX3NlY3JldH19";
    request.files.add(file);
    request.fields['upload_preset'] = 'ml_default';
    request.fields['public_id'] = path.basename(files.path);
    request.fields['api_key'] = '768449823293887';
    try {
      final response = await request.send();
      var data = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        return CloudinaryUploadModel.fromJson(jsonDecode(data));
      } else {
        throw response.reasonPhrase!;
      }
    } catch (error) {
      throw error.toString();
    }
  }
}
