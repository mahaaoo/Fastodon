import 'package:json_annotation/json_annotation.dart'; 
  
part 'home_line.g.dart';


@JsonSerializable()
  class HomeLine extends Object {

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

  @JsonKey(name: 'application')
  Application application;

  @JsonKey(name: 'account')
  Account account;

  @JsonKey(name: 'media_attachments')
  List<dynamic> mediaAttachments;

  @JsonKey(name: 'mentions')
  List<dynamic> mentions;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  @JsonKey(name: 'card')
  Card card;

  HomeLine(this.id,this.createdAt,this.sensitive,this.spoilerText,this.visibility,this.language,this.uri,this.content,this.url,this.repliesCount,this.reblogsCount,this.favouritesCount,this.favourited,this.reblogged,this.muted,this.application,this.account,this.mediaAttachments,this.mentions,this.tags,this.emojis,this.card,);

  factory HomeLine.fromJson(Map<String, dynamic> srcJson) => _$HomeLineFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeLineToJson(this);

}

  
@JsonSerializable()
  class Application extends Object {

  @JsonKey(name: 'name')
  String name;

  Application(this.name,);

  factory Application.fromJson(Map<String, dynamic> srcJson) => _$ApplicationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

}

  
@JsonSerializable()
  class Account extends Object {

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

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  @JsonKey(name: 'fields')
  List<dynamic> fields;

  Account(this.id,this.username,this.acct,this.displayName,this.locked,this.bot,this.createdAt,this.note,this.url,this.avatar,this.avatarStatic,this.header,this.headerStatic,this.followersCount,this.followingCount,this.statusesCount,this.emojis,this.fields,);

  factory Account.fromJson(Map<String, dynamic> srcJson) => _$AccountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

}

  
@JsonSerializable()
  class Card extends Object {

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'author_name')
  String authorName;

  @JsonKey(name: 'author_url')
  String authorUrl;

  @JsonKey(name: 'provider_name')
  String providerName;

  @JsonKey(name: 'provider_url')
  String providerUrl;

  @JsonKey(name: 'html')
  String html;

  @JsonKey(name: 'width')
  int width;

  @JsonKey(name: 'height')
  int height;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'embed_url')
  String embedUrl;

  Card(this.url,this.title,this.description,this.type,this.authorName,this.authorUrl,this.providerName,this.providerUrl,this.html,this.width,this.height,this.image,this.embedUrl,);

  factory Card.fromJson(Map<String, dynamic> srcJson) => _$CardFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CardToJson(this);

}

  
