import 'package:json_annotation/json_annotation.dart'; 
  
part 'owner_account.g.dart';


@JsonSerializable()
  class OwnerAccount extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'acct')
  String acct;

  @JsonKey(name: 'display_name')
  String displayName;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'bot')
  bool bot;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'avatar_static')
  String avatarStatic;

  @JsonKey(name: 'header')
  String header;

  @JsonKey(name: 'header_static')
  String headerStatic;

  @JsonKey(name: 'followers_count')
  int followersCount;

  @JsonKey(name: 'following_count')
  int followingCount;

  @JsonKey(name: 'statuses_count')
  int statusesCount;

  @JsonKey(name: 'source')
  Source source;

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  @JsonKey(name: 'fields')
  List<dynamic> fields;

  OwnerAccount(this.id,this.username,this.acct,this.displayName,this.locked,this.bot,this.createdAt,this.note,this.url,this.avatar,this.avatarStatic,this.header,this.headerStatic,this.followersCount,this.followingCount,this.statusesCount,this.source,this.emojis,this.fields,);

  factory OwnerAccount.fromJson(Map<String, dynamic> srcJson) => _$OwnerAccountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OwnerAccountToJson(this);

}

  
@JsonSerializable()
  class Source extends Object {

  @JsonKey(name: 'privacy')
  String privacy;

  @JsonKey(name: 'sensitive')
  bool sensitive;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'fields')
  List<dynamic> fields;

  Source(this.privacy,this.sensitive,this.note,this.fields,);

  factory Source.fromJson(Map<String, dynamic> srcJson) => _$SourceFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

}

  
