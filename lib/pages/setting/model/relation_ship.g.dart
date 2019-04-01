// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation_ship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationShip _$RelationShipFromJson(Map<String, dynamic> json) {
  return RelationShip(
      json['id'] as String,
      json['following'] as bool,
      json['showing_reblogs'] as bool,
      json['followed_by'] as bool,
      json['blocking'] as bool,
      json['muting'] as bool,
      json['muting_notifications'] as bool,
      json['requested'] as bool,
      json['domain_blocking'] as bool,
      json['endorsed'] as bool);
}

Map<String, dynamic> _$RelationShipToJson(RelationShip instance) =>
    <String, dynamic>{
      'id': instance.id,
      'following': instance.following,
      'showing_reblogs': instance.showingReblogs,
      'followed_by': instance.followedBy,
      'blocking': instance.blocking,
      'muting': instance.muting,
      'muting_notifications': instance.mutingNotifications,
      'requested': instance.requested,
      'domain_blocking': instance.domainBlocking,
      'endorsed': instance.endorsed
    };
