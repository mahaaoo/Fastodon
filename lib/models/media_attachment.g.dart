// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaAttachment _$MediaAttachmentFromJson(Map<String, dynamic> json) {
  return MediaAttachment(
      json['id'] as String,
      json['type'] as String,
      json['url'] as String,
      json['preview_url'] as String,
      json['text_url'] as String,
      json['meta'] as Map,
      );
}

Map<String, dynamic> _$MediaAttachmentToJson(MediaAttachment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'url': instance.url,
      'preview_url': instance.previewUrl,
      'text_url': instance.textUrl,
      'meta': instance.meta
    };
