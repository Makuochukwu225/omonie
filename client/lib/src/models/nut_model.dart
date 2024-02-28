class NutModel {
final String? message;
final List<Nut>? data;
const NutModel({this.message , this.data });
NutModel copyWith({String? message, List<Nut>? data}){
return NutModel(
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

static NutModel fromJson(Map<String , Object?> json){
    return NutModel(
            message:json['message'] == null ? null : json['message'] as String,
data:json['data'] == null ? null : (json['data'] as List).map<Nut>((data)=> Nut.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''NutModel(
                message:$message,
data:${data.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is NutModel && 
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
      
      
class Nut {
final String? id;
final String? image;
final int? nutValue;
final int? nairaValue;
final String? createdAt;
final String? updatedAt;
final int? V;
const Nut({this.id , this.image , this.nutValue , this.nairaValue , this.createdAt , this.updatedAt , this.V });
Nut copyWith({String? id, String? image, int? nutValue, int? nairaValue, String? createdAt, String? updatedAt, int? V}){
return Nut(
            id:id ?? this.id,
image:image ?? this.image,
nutValue:nutValue ?? this.nutValue,
nairaValue:nairaValue ?? this.nairaValue,
createdAt:createdAt ?? this.createdAt,
updatedAt:updatedAt ?? this.updatedAt,
V:V ?? this.V
        );
        }
        
Map<String,Object?> toJson(){
    return {
            '_id': id,
'image': image,
'nutValue': nutValue,
'nairaValue': nairaValue,
'createdAt': createdAt,
'updatedAt': updatedAt,
'__v': V
    };
}

static Nut fromJson(Map<String , Object?> json){
    return Nut(
            id:json['_id'] == null ? null : json['_id'] as String,
image:json['image'] == null ? null : json['image'] as String,
nutValue:json['nutValue'] == null ? null : json['nutValue'] as int,
nairaValue:json['nairaValue'] == null ? null : json['nairaValue'] as int,
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
nutValue:$nutValue,
nairaValue:$nairaValue,
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Nut && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.image == image && 
other.nutValue == nutValue && 
other.nairaValue == nairaValue && 
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
nutValue, 
nairaValue, 
createdAt, 
updatedAt, 
V
    );
}
    
}
      
      
  
     