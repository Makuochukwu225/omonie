class AssetModel {
final String? message;
final List<Asset>? data;
const AssetModel({this.message , this.data });
AssetModel copyWith({String? message, List<Asset>? data}){
return AssetModel(
            message:message ?? this.message,
data:data ?? this.data
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'message': message,
'data': data?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static AssetModel fromJson(Map<String , Object?> json){
    return AssetModel(
            message:json['message'] == null ? null : json['message'] as String,
data:json['data'] == null ? null : (json['data'] as List).map<Asset>((data)=> Asset.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''AssetModel(
                message:$message,
data:${data.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is AssetModel && 
        other.runtimeType == runtimeType &&
        other.message == message && 
other.data == data;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                message, 
data
    );
}
    
}
      
      
class Asset {
final String? id;
final String? image;
final String? title;
final dynamic type;
final String? description;
final int? value;
final String? createdAt;
final String? updatedAt;
final int? V;
const Asset({this.id , this.image , this.title , this.type , this.description , this.value , this.createdAt , this.updatedAt , this.V });
Asset copyWith({String? id, String? image, String? title, dynamic type, String? description, int? value, String? createdAt, String? updatedAt, int? V}){
return Asset(
            id:id ?? this.id,
image:image ?? this.image,
title:title ?? this.title,
type:type ?? this.type,
description:description ?? this.description,
value:value ?? this.value,
createdAt:createdAt ?? this.createdAt,
updatedAt:updatedAt ?? this.updatedAt,
V:V ?? this.V
        );
        }
        
Map<String,Object?> toJson(){
    return {
            '_id': id,
'image': image,
'title': title,
'type': type,
'description': description,
'value': value,
'createdAt': createdAt,
'updatedAt': updatedAt,
'__v': V
    };
}

static Asset fromJson(Map<String , Object?> json){
    return Asset(
            id:json['_id'] == null ? null : json['_id'] as String,
image:json['image'] == null ? null : json['image'] as String,
title:json['title'] == null ? null : json['title'] as String,
type:json['type'] as dynamic,
description:json['description'] == null ? null : json['description'] as String,
value:json['value'] == null ? null : json['value'] as int,
createdAt:json['createdAt'] == null ? null : json['createdAt'] as String,
updatedAt:json['updatedAt'] == null ? null : json['updatedAt'] as String,
V:json['__v'] == null ? null : json['__v'] as int
    );
}

@override
String toString(){
    return '''Data(
                id:$id,
image:$image,
title:$title,
type:$type,
description:$description,
value:$value,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Asset && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.image == image && 
other.title == title && 
other.type == type && 
other.description == description && 
other.value == value && 
other.createdAt == createdAt && 
other.updatedAt == updatedAt && 
other.V == V;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                id, 
image, 
title, 
type, 
description, 
value, 
createdAt, 
updatedAt, 
V
    );
}
    
}
      
      
  
     