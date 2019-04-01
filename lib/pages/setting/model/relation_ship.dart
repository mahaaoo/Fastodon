import 'package:json_annotation/json_annotation.dart'; 
  
part 'relation_ship.g.dart';


@JsonSerializable()
  class RelationShip extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'following')
  bool following;

  @JsonKey(name: 'showing_reblogs')
  bool showingReblogs;

  @JsonKey(name: 'followed_by')
  bool followedBy;

  @JsonKey(name: 'blocking')
  bool blocking;

  @JsonKey(name: 'muting')
  bool muting;

  @JsonKey(name: 'muting_notifications')
  bool mutingNotifications;

  @JsonKey(name: 'requested')
  bool requested;

  @JsonKey(name: 'domain_blocking')
  bool domainBlocking;

  @JsonKey(name: 'endorsed')
  bool endorsed;

  RelationShip(this.id,this.following,this.showingReblogs,this.followedBy,this.blocking,this.muting,this.mutingNotifications,this.requested,this.domainBlocking,this.endorsed,);

  factory RelationShip.fromJson(Map<String, dynamic> srcJson) => _$RelationShipFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RelationShipToJson(this);

}

  
