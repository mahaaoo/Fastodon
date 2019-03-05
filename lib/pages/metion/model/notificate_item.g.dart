// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificate_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificateItem _$NotificateItemFromJson(Map<String, dynamic> json) {
  return NotificateItem(
      json['id'] as String,
      json['type'] as String,
      json['created_at'] as String,
      json['account'] == null
          ? null
          : OwnerAccount.fromJson(json['account'] as Map<String, dynamic>),
      json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NotificateItemToJson(NotificateItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'created_at': instance.createdAt,
      'account': instance.account,
      'status': instance.status
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
      json['id'] as String,
      json['created_at'] as String,
      json['sensitive'] as bool,
      json['spoiler_text'] as String,
      json['visibility'] as String,
      json['language'] as String,
      json['uri'] as String,
      json['content'] as String,
      json['url'] as String,
      json['replies_count'] as int,
      json['reblogs_count'] as int,
      json['favourites_count'] as int,
      json['favourited'] as bool,
      json['reblogged'] as bool,
      json['muted'] as bool,
      json['pinned'] as bool,
      json['application'] == null
          ? null
          : Application.fromJson(json['application'] as Map<String, dynamic>),
      json['account'] == null
          ? null
          : OwnerAccount.fromJson(json['account'] as Map<String, dynamic>),
      json['media_attachments'] as List,
      json['mentions'] as List,
      json['tags'] as List,
      json['emojis'] as List);
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'sensitive': instance.sensitive,
      'spoiler_text': instance.spoilerText,
      'visibility': instance.visibility,
      'language': instance.language,
      'uri': instance.uri,
      'content': instance.content,
      'url': instance.url,
      'replies_count': instance.repliesCount,
      'reblogs_count': instance.reblogsCount,
      'favourites_count': instance.favouritesCount,
      'favourited': instance.favourited,
      'reblogged': instance.reblogged,
      'muted': instance.muted,
      'pinned': instance.pinned,
      'application': instance.application,
      'account': instance.account,
      'media_attachments': instance.mediaAttachments,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(json['name'] as String, json['website'] as String);
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{'name': instance.name, 'website': instance.website};
