class AvatarModel {
  final String? message;
  final List<Avatar>? data;
  const AvatarModel({this.message, this.data});
  AvatarModel copyWith({String? message, List<Avatar>? data}) {
    return AvatarModel(
        message: message ?? this.message, data: data ?? this.data);
  }

  Map<String, Object?> toJson() {
    return {
      'message': message,
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList()
    };
  }

  static AvatarModel fromJson(Map<String, Object?> json) {
    return AvatarModel(
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<Avatar>(
                    (data) => Avatar.fromJson(data as Map<String, Object?>))
                .toList());
  }

  @override
  String toString() {
    return '''AvatarModel(
                message:$message,
data:${data.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AvatarModel &&
        other.runtimeType == runtimeType &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message, data);
  }
}

class Avatar {
  final String? id;
  final String? image;
  final String? title;
  final dynamic owner;
  final String? description;
  final int? value;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  const Avatar(
      {this.id,
      this.image,
      this.title,
      this.owner,
      this.description,
      this.value,
      this.createdAt,
      this.updatedAt,
      this.V});
  Avatar copyWith(
      {String? id,
      String? image,
      String? title,
      dynamic owner,
      String? description,
      int? value,
      String? createdAt,
      String? updatedAt,
      int? V}) {
    return Avatar(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        owner: owner ?? this.owner,
        description: description ?? this.description,
        value: value ?? this.value,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        V: V ?? this.V);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'image': image,
      'title': title,
      'owner': owner,
      'description': description,
      'value': value,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': V
    };
  }

  static Avatar fromJson(Map<String, Object?> json) {
    return Avatar(
        id: json['_id'] == null ? null : json['_id'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        owner: json['owner'] as dynamic,
        description:
            json['description'] == null ? null : json['description'] as String,
        value: json['value'] == null ? null : json['value'] as int,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
        V: json['__v'] == null ? null : json['__v'] as int);
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
image:$image,
title:$title,
owner:$owner,
description:$description,
value:$value,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Avatar &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.image == image &&
        other.title == title &&
        other.owner == owner &&
        other.description == description &&
        other.value == value &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.V == V;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, image, title, owner, description, value,
        createdAt, updatedAt, V);
  }
}
