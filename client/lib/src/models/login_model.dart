class LoginModel {
final String? userId;
final String? email;
final String? firstName;
final String? message;
final String? accessToken;
final String? refreshToken;
const LoginModel({this.userId , this.email , this.firstName , this.message , this.accessToken , this.refreshToken });
LoginModel copyWith({String? userId, String? email, String? firstName, String? message, String? accessToken, String? refreshToken}){
return LoginModel(
            userId:userId ?? this.userId,
email:email ?? this.email,
firstName:firstName ?? this.firstName,
message:message ?? this.message,
accessToken:accessToken ?? this.accessToken,
refreshToken:refreshToken ?? this.refreshToken
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'userId': userId,
'email': email,
'firstName': firstName,
'message': message,
'accessToken': accessToken,
'refreshToken': refreshToken
    };
}

static LoginModel fromJson(Map<String , Object?> json){
    return LoginModel(
            userId:json['userId'] == null ? null : json['userId'] as String,
email:json['email'] == null ? null : json['email'] as String,
firstName:json['firstName'] == null ? null : json['firstName'] as String,
message:json['message'] == null ? null : json['message'] as String,
accessToken:json['accessToken'] == null ? null : json['accessToken'] as String,
refreshToken:json['refreshToken'] == null ? null : json['refreshToken'] as String
    );
}

@override
String toString(){
    return '''LoginModel(
                userId:$userId,
email:$email,
firstName:$firstName,
message:$message,
accessToken:$accessToken,
refreshToken:$refreshToken
    ) ''';
}

@override
bool operator ==(Object other){
    return other is LoginModel && 
        other.runtimeType == runtimeType &&
        other.userId == userId && 
other.email == email && 
other.firstName == firstName && 
other.message == message && 
other.accessToken == accessToken && 
other.refreshToken == refreshToken;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                userId, 
email, 
firstName, 
message, 
accessToken, 
refreshToken
    );
}
    
}
      
      
  
     