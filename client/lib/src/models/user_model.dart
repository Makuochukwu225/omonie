import 'package:omonie/src/src.dart';

class UserModel {
  final String? message;
  final UserData? data;
  const UserModel({this.message, this.data});
  UserModel copyWith({String? message, UserData? data}) {
    return UserModel(message: message ?? this.message, data: data ?? this.data);
  }

  Map<String, Object?> toJson() {
    return {'message': message, 'data': data?.toJson()};
  }

  static UserModel fromJson(Map<String, Object?> json) {
    return UserModel(
        message: json['message'] == null ? null : json['message'] as String,
        data: json['data'] == null
            ? null
            : UserData.fromJson(json['data'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''UserModel(
                message:$message,
data:${data.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserModel &&
        other.runtimeType == runtimeType &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, message, data);
  }
}

class UserData {
  final String? id;
  final String? firstName;
  final Avatar? avatar;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? userName;
  final String? location;
  final String? phoneNumber;
  final String? dateOfBirth;
  final int? availableNut;
  final int? availableNaira;
  final int? level;
  final bool? verified;
  final String? createdAt;
  final String? updatedAt;
  final int? V;
  final List<Following>? following;
  final List<dynamic>? intentions;
  final List<Followers>? followers;
  final List<Avatar>? assets;
  final int? followerCount;
  final int? followingCount;
  final List<Post>? post;
  final int? postCount;
  const UserData(
      {this.id,
      this.firstName,
      this.avatar,
      this.lastName,
      this.email,
      this.gender,
      this.userName,
      this.location,
      this.phoneNumber,
      this.dateOfBirth,
      this.availableNut,
      this.availableNaira,
      this.level,
      this.verified,
      this.createdAt,
      this.updatedAt,
      this.V,
      this.following,
      this.intentions,
      this.followers,
      this.assets,
      this.followerCount,
      this.followingCount,
      this.post,
      this.postCount});
  UserData copyWith(
      {String? id,
      String? firstName,
      Avatar? avatar,
      String? lastName,
      String? email,
      String? gender,
      String? userName,
      String? location,
      String? phoneNumber,
      String? dateOfBirth,
      int? availableNut,
      int? availableNaira,
      int? level,
      bool? verified,
      String? createdAt,
      String? updatedAt,
      int? V,
      List<Following>? following,
      List<dynamic>? intentions,
      List<Followers>? followers,
      List<Avatar>? assets,
      int? followerCount,
      int? followingCount,
      List<Post>? post,
      int? postCount}) {
    return UserData(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        avatar: avatar ?? this.avatar,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        userName: userName ?? this.userName,
        location: location ?? this.location,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        availableNut: availableNut ?? this.availableNut,
        availableNaira: availableNaira ?? this.availableNaira,
        level: level ?? this.level,
        verified: verified ?? this.verified,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        V: V ?? this.V,
        following: following ?? this.following,
        intentions: intentions ?? this.intentions,
        followers: followers ?? this.followers,
        assets: assets ?? this.assets,
        followerCount: followerCount ?? this.followerCount,
        followingCount: followingCount ?? this.followingCount,
        post: post ?? this.post,
        postCount: postCount ?? this.postCount);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'avatar': avatar?.toJson(),
      'lastName': lastName,
      'email': email,
      'gender': gender,
      'userName': userName,
      'location': location,
      'phoneNumber': phoneNumber,
      'dateOfBirth': dateOfBirth,
      'availableNut': availableNut,
      'availableNaira': availableNaira,
      'level': level,
      'verified': verified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': V,
      'following': following
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'intentions': intentions,
      'followers': followers
          ?.map<Map<String, dynamic>>((data) => data.toJson())
          .toList(),
      'assets':
          assets?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'followerCount': followerCount,
      'followingCount': followingCount,
      'post': post?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'postCount': postCount
    };
  }

  static UserData fromJson(Map<String, Object?> json) {
    return UserData(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, Object?>),
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        email: json['email'] == null ? null : json['email'] as String,
        gender: json['gender'] == null ? null : json['gender'] as String,
        userName: json['userName'] == null ? null : json['userName'] as String,
        location: json['location'] == null ? null : json['location'] as String,
        phoneNumber:
            json['phoneNumber'] == null ? null : json['phoneNumber'] as String,
        dateOfBirth:
            json['dateOfBirth'] == null ? null : json['dateOfBirth'] as String,
        availableNut:
            json['availableNut'] == null ? null : json['availableNut'] as int,
        availableNaira: json['availableNaira'] == null
            ? null
            : json['availableNaira'] as int,
        level: json['level'] == null ? null : json['level'] as int,
        verified: json['verified'] == null ? null : json['verified'] as bool,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
        V: json['__v'] == null ? null : json['__v'] as int,
        following: json['following'] == null
            ? null
            : (json['following'] as List)
                .map<Following>(
                    (data) => Following.fromJson(data as Map<String, Object?>))
                .toList(),
        intentions: json['intentions'] == null
            ? null
            : json['intentions'] as List<dynamic>,
        followers: json['followers'] == null
            ? null
            : (json['followers'] as List)
                .map<Followers>(
                    (data) => Followers.fromJson(data as Map<String, Object?>))
                .toList(),
        assets: json['assets'] == null
            ? null
            : (json['assets'] as List)
                .map<Avatar>(
                    (data) => Avatar.fromJson(data as Map<String, Object?>))
                .toList(),
        followerCount:
            json['followerCount'] == null ? null : json['followerCount'] as int,
        followingCount: json['followingCount'] == null
            ? null
            : json['followingCount'] as int,
        post: json['post'] == null
            ? null
            : (json['post'] as List)
                .map<Post>(
                    (data) => Post.fromJson(data as Map<String, Object?>))
                .toList(),
        postCount: json['postCount'] == null ? null : json['postCount'] as int);
  }

  @override
  String toString() {
    return '''Data(
                id:$id,
firstName:$firstName,
avatar:${avatar.toString()},
lastName:$lastName,
email:$email,
gender:$gender,
userName:$userName,
location:$location,
phoneNumber:$phoneNumber,
dateOfBirth:$dateOfBirth,
availableNut:$availableNut,
availableNaira:$availableNaira,
level:$level,
verified:$verified,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V,
following:${following.toString()},
intentions:$intentions,
followers:${followers.toString()},
assets:${assets.toString()},
followerCount:$followerCount,
followingCount:$followingCount,
post:${post.toString()},
postCount:$postCount
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is UserData &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.avatar == avatar &&
        other.lastName == lastName &&
        other.email == email &&
        other.gender == gender &&
        other.userName == userName &&
        other.location == location &&
        other.phoneNumber == phoneNumber &&
        other.dateOfBirth == dateOfBirth &&
        other.availableNut == availableNut &&
        other.availableNaira == availableNaira &&
        other.level == level &&
        other.verified == verified &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.V == V &&
        other.following == following &&
        other.intentions == intentions &&
        other.followers == followers &&
        other.assets == assets &&
        other.followerCount == followerCount &&
        other.followingCount == followingCount &&
        other.post == post &&
        other.postCount == postCount;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        firstName,
        avatar,
        lastName,
        email,
        gender,
        userName,
        location,
        phoneNumber,
        dateOfBirth,
        availableNut,
        availableNaira,
        level,
        verified,
        createdAt,
        updatedAt,
        V,
        following,
        intentions);
  }
}

class Followers {
  final String? id;
  final String? firstName;
  final dynamic avatar;
  final String? lastName;
  final String? email;
  const Followers(
      {this.id, this.firstName, this.avatar, this.lastName, this.email});
  Followers copyWith(
      {String? id,
      String? firstName,
      dynamic avatar,
      String? lastName,
      String? email}) {
    return Followers(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        avatar: avatar ?? this.avatar,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'avatar': avatar,
      'lastName': lastName,
      'email': email
    };
  }

  static Followers fromJson(Map<String, Object?> json) {
    return Followers(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        avatar: json['avatar'] as dynamic,
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        email: json['email'] == null ? null : json['email'] as String);
  }

  @override
  String toString() {
    return '''Followers(
                id:$id,
firstName:$firstName,
avatar:$avatar,
lastName:$lastName,
email:$email
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Followers &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.avatar == avatar &&
        other.lastName == lastName &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, firstName, avatar, lastName, email);
  }
}

class Following {
  final String? id;
  final String? firstName;
  final Avatar? avatar;
  final String? lastName;
  final String? email;
  const Following(
      {this.id, this.firstName, this.avatar, this.lastName, this.email});
  Following copyWith(
      {String? id,
      String? firstName,
      Avatar? avatar,
      String? lastName,
      String? email}) {
    return Following(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        avatar: avatar ?? this.avatar,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email);
  }

  Map<String, Object?> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'avatar': avatar?.toJson(),
      'lastName': lastName,
      'email': email
    };
  }

  static Following fromJson(Map<String, Object?> json) {
    return Following(
        id: json['_id'] == null ? null : json['_id'] as String,
        firstName:
            json['firstName'] == null ? null : json['firstName'] as String,
        avatar: json['avatar'] == null
            ? null
            : Avatar.fromJson(json['avatar'] as Map<String, Object?>),
        lastName: json['lastName'] == null ? null : json['lastName'] as String,
        email: json['email'] == null ? null : json['email'] as String);
  }

  @override
  String toString() {
    return '''Following(
                id:$id,
firstName:$firstName,
avatar:${avatar.toString()},
lastName:$lastName,
email:$email
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Following &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.firstName == firstName &&
        other.avatar == avatar &&
        other.lastName == lastName &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, firstName, avatar, lastName, email);
  }
}
