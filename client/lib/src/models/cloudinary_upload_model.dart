class CloudinaryUploadModel {
  final String? assetId;
  final String? publicId;
  final int? version;
  final String? versionId;
  final String? signature;
  final int? width;
  final int? height;
  final String? format;
  final String? resourceType;
  final String? createdAt;
  final List<dynamic>? tags;
  final int? bytes;
  final String? type;
  final String? etag;
  final bool? placeholder;
  final String? url;
  final String? secureUrl;
  final String? folder;
  final String? accessMode;
  final bool? existing;
  const CloudinaryUploadModel(
      {this.assetId,
      this.publicId,
      this.version,
      this.versionId,
      this.signature,
      this.width,
      this.height,
      this.format,
      this.resourceType,
      this.createdAt,
      this.tags,
      this.bytes,
      this.type,
      this.etag,
      this.placeholder,
      this.url,
      this.secureUrl,
      this.folder,
      this.accessMode,
      this.existing});
  CloudinaryUploadModel copyWith(
      {String? assetId,
      String? publicId,
      int? version,
      String? versionId,
      String? signature,
      int? width,
      int? height,
      String? format,
      String? resourceType,
      String? createdAt,
      List<dynamic>? tags,
      int? bytes,
      String? type,
      String? etag,
      bool? placeholder,
      String? url,
      String? secureUrl,
      String? folder,
      String? accessMode,
      bool? existing}) {
    return CloudinaryUploadModel(
        assetId: assetId ?? this.assetId,
        publicId: publicId ?? this.publicId,
        version: version ?? this.version,
        versionId: versionId ?? this.versionId,
        signature: signature ?? this.signature,
        width: width ?? this.width,
        height: height ?? this.height,
        format: format ?? this.format,
        resourceType: resourceType ?? this.resourceType,
        createdAt: createdAt ?? this.createdAt,
        tags: tags ?? this.tags,
        bytes: bytes ?? this.bytes,
        type: type ?? this.type,
        etag: etag ?? this.etag,
        placeholder: placeholder ?? this.placeholder,
        url: url ?? this.url,
        secureUrl: secureUrl ?? this.secureUrl,
        folder: folder ?? this.folder,
        accessMode: accessMode ?? this.accessMode,
        existing: existing ?? this.existing);
  }

  Map<String, Object?> toJson() {
    return {
      'asset_id': assetId,
      'public_id': publicId,
      'version': version,
      'version_id': versionId,
      'signature': signature,
      'width': width,
      'height': height,
      'format': format,
      'resource_type': resourceType,
      'created_at': createdAt,
      'tags': tags,
      'bytes': bytes,
      'type': type,
      'etag': etag,
      'placeholder': placeholder,
      'url': url,
      'secure_url': secureUrl,
      'folder': folder,
      'access_mode': accessMode,
      'existing': existing
    };
  }

  static CloudinaryUploadModel fromJson(Map<String, Object?> json) {
    return CloudinaryUploadModel(
        assetId: json['asset_id'] == null ? null : json['asset_id'] as String,
        publicId:
            json['public_id'] == null ? null : json['public_id'] as String,
        version: json['version'] == null ? null : json['version'] as int,
        versionId:
            json['version_id'] == null ? null : json['version_id'] as String,
        signature:
            json['signature'] == null ? null : json['signature'] as String,
        width: json['width'] == null ? null : json['width'] as int,
        height: json['height'] == null ? null : json['height'] as int,
        format: json['format'] == null ? null : json['format'] as String,
        resourceType: json['resource_type'] == null
            ? null
            : json['resource_type'] as String,
        createdAt:
            json['created_at'] == null ? null : json['created_at'] as String,
        tags: json['tags'] == null ? null : json['tags'] as List<dynamic>,
        bytes: json['bytes'] == null ? null : json['bytes'] as int,
        type: json['type'] == null ? null : json['type'] as String,
        etag: json['etag'] == null ? null : json['etag'] as String,
        placeholder:
            json['placeholder'] == null ? null : json['placeholder'] as bool,
        url: json['url'] == null ? null : json['url'] as String,
        secureUrl:
            json['secure_url'] == null ? null : json['secure_url'] as String,
        folder: json['folder'] == null ? null : json['folder'] as String,
        accessMode:
            json['access_mode'] == null ? null : json['access_mode'] as String,
        existing: json['existing'] == null ? null : json['existing'] as bool);
  }

  @override
  String toString() {
    return '''CloudinaryUploadModel(
                assetId:$assetId,
publicId:$publicId,
version:$version,
versionId:$versionId,
signature:$signature,
width:$width,
height:$height,
format:$format,
resourceType:$resourceType,
createdAt:$createdAt,
tags:$tags,
bytes:$bytes,
type:$type,
etag:$etag,
placeholder:$placeholder,
url:$url,
secureUrl:$secureUrl,
folder:$folder,
accessMode:$accessMode,
existing:$existing
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CloudinaryUploadModel &&
        other.runtimeType == runtimeType &&
        other.assetId == assetId &&
        other.publicId == publicId &&
        other.version == version &&
        other.versionId == versionId &&
        other.signature == signature &&
        other.width == width &&
        other.height == height &&
        other.format == format &&
        other.resourceType == resourceType &&
        other.createdAt == createdAt &&
        other.tags == tags &&
        other.bytes == bytes &&
        other.type == type &&
        other.etag == etag &&
        other.placeholder == placeholder &&
        other.url == url &&
        other.secureUrl == secureUrl &&
        other.folder == folder &&
        other.accessMode == accessMode &&
        other.existing == existing;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        assetId,
        publicId,
        version,
        versionId,
        signature,
        width,
        height,
        format,
        resourceType,
        createdAt,
        tags,
        bytes,
        type,
        etag,
        placeholder,
        url,
        secureUrl,
        folder,
        accessMode);
  }
}
