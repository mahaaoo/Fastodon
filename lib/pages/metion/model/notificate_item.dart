import 'package:json_annotation/json_annotation.dart'; 
import 'package:fastodon/pages/setting/model/owner_account.dart';

part 'notificate_item.g.dart';


@JsonSerializable()
  class NotificateItem extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'account')
  OwnerAccount account;

  @JsonKey(name: 'status')
  Status status;

  NotificateItem(this.id,this.type,this.createdAt,this.account,this.status,);

  factory NotificateItem.fromJson(Map<String, dynamic> srcJson) => _$NotificateItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NotificateItemToJson(this);

}

@JsonSerializable()
  class Status extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'sensitive')
  bool sensitive;

  @JsonKey(name: 'spoiler_text')
  String spoilerText;

  @JsonKey(name: 'visibility')
  String visibility;

  @JsonKey(name: 'language')
  String language;

  @JsonKey(name: 'uri')
  String uri;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'replies_count')
  int repliesCount;

  @JsonKey(name: 'reblogs_count')
  int reblogsCount;

  @JsonKey(name: 'favourites_count')
  int favouritesCount;

  @JsonKey(name: 'favourited')
  bool favourited;

  @JsonKey(name: 'reblogged')
  bool reblogged;

  @JsonKey(name: 'muted')
  bool muted;

  @JsonKey(name: 'pinned')
  bool pinned;

  @JsonKey(name: 'application')
  Application application;

  @JsonKey(name: 'account')
  OwnerAccount account;

  @JsonKey(name: 'media_attachments')
  List<dynamic> mediaAttachments;

  @JsonKey(name: 'mentions')
  List<dynamic> mentions;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  Status(this.id,this.createdAt,this.sensitive,this.spoilerText,this.visibility,this.language,this.uri,this.content,this.url,this.repliesCount,this.reblogsCount,this.favouritesCount,this.favourited,this.reblogged,this.muted,this.pinned,this.application,this.account,this.mediaAttachments,this.mentions,this.tags,this.emojis,);

  factory Status.fromJson(Map<String, dynamic> srcJson) => _$StatusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StatusToJson(this);

}

  
@JsonSerializable()
  class Application extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'website')
  String website;

  Application(this.name,this.website,);

  factory Application.fromJson(Map<String, dynamic> srcJson) => _$ApplicationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

}
