import 'package:omonie/src/src.dart';

class PostModel {
  final String? message;
  final List<Post>? data;
  final int? page;
  final int? limit;
  final int? totalPosts;
  final int? totalPages;
  final bool? hasMorePages;
  const PostModel(
      {this.message,
      this.data,
      this.page,
      this.limit,
      this.totalPosts,
      this.totalPages,
      this.hasMorePages});
  PostModel copyWith(
      {String? message,
      List<Post>? data,
      int? page,
      int? limit,
      int? totalPosts,
      int? totalPages,
      bool? hasMorePages}) {
    return PostModel(
        message: message ?? this.message,
        data: data ?? this.data,
        page: page ?? this.page,
        limit: limit ?? this.limit,
        totalPosts: totalPosts ?? this.totalPosts,
        totalPages: totalPages ?? this.totalPages,
        hasMorePages: hasMorePages ?? this.hasMorePages);
  }

  Map<String, Object?> toJson() {
    return {
      'message': message,
      'data': data?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'page': page,
      'limit': limit,
      'totalPosts': totalPosts,
      'totalPages': totalPages,
      'hasMorePages': hasMorePages
    };
  }

  static PostModel fromJson(Map<String, Object?> json) {
    return PostModel(
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : (json['data'] as List)
                .map<Post>(
                    (data) => Post.fromJson(data as Map<String, Object?>))
                .toList(),
        page: json['page'] == null ? null : json['page'] as int,
        limit: json['limit'] == null ? null : json['limit'] as int,
        totalPosts:
            json['totalPosts'] == null ? null : json['totalPosts'] as int,
        totalPages:
            json['totalPages'] == null ? null : json['totalPages'] as int,
        hasMorePages:
            json['hasMorePages'] == null ? null : json['hasMorePages'] as bool);
  }

  @override
  String toString() {
    return '''PostModel(
                message:$message,
data:${data.toString()},
page:$page,
limit:$limit,
totalPosts:$totalPosts,
totalPages:$totalPages,
hasMorePages:$hasMorePages
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is PostModel &&
        other.runtimeType == runtimeType &&
        other.message == message &&
        other.data == data &&
        other.page == page &&
        other.limit == limit &&
        other.totalPosts == totalPosts &&
        other.totalPages == totalPages &&
        other.hasMorePages == hasMorePages;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message, data, page, limit, totalPosts,
        totalPages, hasMorePages);
  }
}

class Post {
  final String? id;
  final String? title;
  final User? user;
  final String? description;
  final String? image;
  final String? type;
  final List<dynamic>? tags;
  final bool? verified;
  final List<dynamic>? like;
  final List<dynamic>? comments;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  const Post(
      {this.id,
      this.title,
      this.user,
      this.description,
      this.image,
      this.type,
      this.tags,
      this.verified,
      this.like,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.V});
  Post copyWith(
      {String? id,
      String? title,
      User? user,
      String? description,
      String? image,
      String? type,
      List<dynamic>? tags,
      bool? verified,
      List<dynamic>? like,
      List<dynamic>? comments,
      String? createdAt,
      String? updatedAt,
      int? V}) {
    return Post(
        id: id ?? this.id,
        title: title ?? this.title,
        user: user ?? this.user,
        description: description ?? this.description,
        image: image ?? this.image,
        type: type ?? this.type,
        tags: tags ?? this.tags,
        verified: verified ?? this.verified,
        like: like ?? this.like,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        V: V ?? this.V);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'title': title,
      'user': user?.toJson(),
      'description': description,
      'image': image,
      'type': type,
      'tags': tags,
      'verified': verified,
      'like': like,
      'comments': comments,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': V
    };
  }

  static Post fromJson(Map<String, Object?> json) {
    return Post(
        id: json['_id'] == null ? null : json['_id'] as String,
        title: json['title'] == null ? null : json['title'] as String,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, Object?>),
        description:
            json['description'] == null ? null : json['description'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        type: json['type'] == null ? null : json['type'] as String,
        tags: json['tags'] == null ? null : json['tags'] as List<dynamic>,
        verified: json['verified'] == null ? null : json['verified'] as bool,
        like: json['like'] == null ? null : json['like'] as List<dynamic>,
        comments:
            json['comments'] == null ? null : json['comments'] as List<dynamic>,
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
title:$title,
user:${user.toString()},
description:$description,
image:$image,
type:$type,
tags:$tags,
verified:$verified,
like:$like,
comments:$comments,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Post &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.user == user &&
        other.description == description &&
        other.image == image &&
        other.type == type &&
        other.tags == tags &&
        other.verified == verified &&
        other.like == like &&
        other.comments == comments &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.V == V;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, title, user, description, image, type,
        tags, verified, like, comments, createdAt, updatedAt, V);
  }
}

class User {
  final String? id;
  final String? firstName;
  final Avatar? avatar;
  final String? lastName;
  const User({this.id, this.firstName, this.avatar, this.lastName});
  User copyWith(
      {String? id, String? firstName, Avatar? avatar, String? lastName}) {
    return User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        avatar: avatar ?? this.avatar,
        lastName: lastName ?? this.lastName);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'avatar': avatar?.toJson(),
      'lastName': lastName
    };
  }

  static User fromJson(Map<String, Object?> json) {
    return User(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, Object?>),
        lastName: json['lastName'] == null ? null : json['lastName'] as String);
  }

  @override
  String toString() {
    return '''User(
                id:$id,
firstName:$firstName,
avatar:${avatar.toString()},
lastName:$lastName
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is User &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.avatar == avatar &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, firstName, avatar, lastName);
  }
}
