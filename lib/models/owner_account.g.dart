// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerAccount _$OwnerAccountFromJson(Map<String, dynamic> json) {
  return OwnerAccount(
      json['id'] as String,
      json['username'] as String,
      json['acct'] as String,
      json['display_name'] as String,
      json['locked'] as bool,
      json['bot'] as bool,
      json['created_at'] as String,
      json['note'] as String,
      json['url'] as String,
      json['avatar'] as String,
      json['avatar_static'] as String,
      json['header'] as String,
      json['header_static'] as String,
      json['followers_count'] as int,
      json['following_count'] as int,
      json['statuses_count'] as int,
      json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
      json['emojis'] as List,
      json['fields'] as List);
}

Map<String, dynamic> _$OwnerAccountToJson(OwnerAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'acct': instance.acct,
      'display_name': instance.displayName,
      'locked': instance.locked,
      'bot': instance.bot,
      'created_at': instance.createdAt,
      'note': instance.note,
      'url': instance.url,
      'avatar': instance.avatar,
      'avatar_static': instance.avatarStatic,
      'header': instance.header,
      'header_static': instance.headerStatic,
      'followers_count': instance.followersCount,
      'following_count': instance.followingCount,
      'statuses_count': instance.statusesCount,
      'source': instance.source,
      'emojis': instance.emojis,
      'fields': instance.fields
    };

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(json['privacy'] as String, json['sensitive'] as bool,
      json['note'] as String, json['fields'] as List);
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'privacy': instance.privacy,
      'sensitive': instance.sensitive,
      'note': instance.note,
      'fields': instance.fields
    };
