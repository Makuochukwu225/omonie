import 'package:omonie/src/src.dart';

class CheckPhoneModel {
  final List<UserData>? data;
  final String? message;
  const CheckPhoneModel({this.data, this.message});
  CheckPhoneModel copyWith({List<UserData>? data, String? message}) {
    return CheckPhoneModel(
        data: data ?? this.data, message: message ?? this.message);
  }

  Map<String, Object?> toJson() {
    return {
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'message': message
    };
  }

  static CheckPhoneModel fromJson(Map<String, Object?> json) {
    return CheckPhoneModel(
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<UserData>(
                    (data) => UserData.fromJson(data as Map<String, Object?>))
                .toList(),
        message: json['message'] == null ? null : json['message'] as String);
  }

  @override
  String toString() {
    return '''CheckPhoneModel(
                data:${data.toString()},
message:$message
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CheckPhoneModel &&
        other.runtimeType == runtimeType &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, data, message);
  }
}
