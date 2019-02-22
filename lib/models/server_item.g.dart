// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerItem _$ServerItemFromJson(Map<String, dynamic> json) {
  return ServerItem(
      json['id'] as String,
      json['name'] as String,
      json['updated_at'] as String,
      json['checked_at'] as String,
      json['uptime'] as int,
      json['up'] as bool,
      json['dead'] as bool,
      json['version'] as String,
      json['ipv6'] as bool,
      json['https_score'] as int,
      json['https_rank'] as String,
      json['obs_score'] as int,
      json['obs_rank'] as String,
      json['users'] as String,
      json['statuses'] as String,
      json['connections'] as String,
      json['open_registrations'] as bool,
      json['info'] == null
          ? null
          : Info.fromJson(json['info'] as Map<String, dynamic>),
      json['thumbnail'] as String,
      json['thumbnail_proxy'] as String,
      json['active_users'] as int);
}

Map<String, dynamic> _$ServerItemToJson(ServerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updated_at': instance.updatedAt,
      'checked_at': instance.checkedAt,
      'uptime': instance.uptime,
      'up': instance.up,
      'dead': instance.dead,
      'version': instance.version,
      'ipv6': instance.ipv6,
      'https_score': instance.httpsScore,
      'https_rank': instance.httpsRank,
      'obs_score': instance.obsScore,
      'obs_rank': instance.obsRank,
      'users': instance.users,
      'statuses': instance.statuses,
      'connections': instance.connections,
      'open_registrations': instance.openRegistrations,
      'info': instance.info,
      'thumbnail': instance.thumbnail,
      'thumbnail_proxy': instance.thumbnailProxy,
      'active_users': instance.activeUsers
    };

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
      json['short_description'] as String,
      json['full_description'] as String,
      (json['languages'] as List)?.map((e) => e as String)?.toList(),
      json['other_languages_accepted'] as bool,
      (json['prohibited_content'] as List)?.map((e) => e as String)?.toList(),
      json['categories'] as List);
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'short_description': instance.shortDescription,
      'full_description': instance.fullDescription,
      'languages': instance.languages,
      'other_languages_accepted': instance.otherLanguagesAccepted,
      'prohibited_content': instance.prohibitedContent,
      'categories': instance.categories
    };
