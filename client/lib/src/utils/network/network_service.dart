import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

enum RequestTypes { get, put, post, patch, delete }

class NetworkService {
  const NetworkService._();

  static Map<String, String> _getHeaders(var token, var contentType) =>
      {'Content-Type': contentType, 'Authorization': 'Bearer $token'};

  static Future<http.Response>? _createRequest({
    required RequestTypes requestType,
    required Uri uri,
    Map<String, String>? headers,
    String? body,
  }) {
    switch (requestType) {
      case RequestTypes.get:
        return http.get(uri, headers: headers).timeout(
          const Duration(seconds: 30),
          onTimeout: () {
            return http.Response('Network error, timeout', 408);
          },
        );
      case RequestTypes.post:
        return http.post(uri, headers: headers, body: body).timeout(
          const Duration(seconds: 120),
          onTimeout: () {
            return http.Response('Network error, timeout', 408);
          },
        );
      case RequestTypes.put:
        return http.put(uri, headers: headers, body: body).timeout(
          const Duration(seconds: 120),
          onTimeout: () {
            return http.Response('Network error, timeout', 408);
          },
        );
      case RequestTypes.patch:
        return http.patch(uri, headers: headers, body: body).timeout(
          const Duration(seconds: 120),
          onTimeout: () {
            return http.Response('Network error, timeout', 408);
          },
        );
      case RequestTypes.delete:
        return http.delete(uri, headers: headers, body: body).timeout(
          const Duration(seconds: 120),
          onTimeout: () {
            return http.Response('Network error, timeout', 408);
          },
        );
    }
  }

  static Future<http.Response?>? sendRequest({
    required RequestTypes requestType,
    required String url,
    String token = '',
    String contentType = 'application/json',
    String? body,
  }) async {
    try {
      final header = _getHeaders(token, contentType);

      final response = await _createRequest(
          requestType: requestType,
          uri: Uri.parse(url),
          headers: header,
          body: body);
      log(response!.body);
      return response;
    } on SocketException catch (_) {
      throw "No network";
    } catch (e) {
      throw e.toString();
    }
  }
}
