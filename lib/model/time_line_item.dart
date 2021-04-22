import 'package:json_annotation/json_annotation.dart'; 
  
part 'time_line_item.g.dart';


@JsonSerializable()
  class TimeLineItem extends Object {

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

  @JsonKey(name: 'bookmarked')
  bool bookmarked;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'account')
  Account account;

  @JsonKey(name: 'media_attachments')
  List<dynamic> mediaAttachments;

  @JsonKey(name: 'mentions')
  List<dynamic> mentions;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  @JsonKey(name: 'card')
  Card card;

  TimeLineItem(this.id,this.createdAt,this.sensitive,this.spoilerText,this.visibility,this.language,this.uri,this.url,this.repliesCount,this.reblogsCount,this.favouritesCount,this.favourited,this.reblogged,this.muted,this.bookmarked,this.content,this.account,this.mediaAttachments,this.mentions,this.tags,this.emojis,this.card,);

  factory TimeLineItem.fromJson(Map<String, dynamic> srcJson) => _$TimeLineItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TimeLineItemToJson(this);

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

  @JsonKey(name: 'discoverable')
  bool discoverable;

  @JsonKey(name: 'group')
  bool group;

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

  @JsonKey(name: 'last_status_at')
  String lastStatusAt;

  @JsonKey(name: 'emojis')
  List<dynamic> emojis;

  @JsonKey(name: 'fields')
  List<Fields> fields;

  Account(this.id,this.username,this.acct,this.displayName,this.locked,this.bot,this.discoverable,this.group,this.createdAt,this.note,this.url,this.avatar,this.avatarStatic,this.header,this.headerStatic,this.followersCount,this.followingCount,this.statusesCount,this.lastStatusAt,this.emojis,this.fields,);

  factory Account.fromJson(Map<String, dynamic> srcJson) => _$AccountFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

}

  
@JsonSerializable()
  class Fields extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'value')
  String value;

  Fields(this.name,this.value,);

  factory Fields.fromJson(Map<String, dynamic> srcJson) => _$FieldsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FieldsToJson(this);

}

  
@JsonSerializable()
  class Tags extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

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

  @JsonKey(name: 'blurhash')
  String blurhash;

  Card(this.url,this.title,this.description,this.type,this.authorName,this.authorUrl,this.providerName,this.providerUrl,this.html,this.width,this.height,this.image,this.embedUrl,this.blurhash,);

  factory Card.fromJson(Map<String, dynamic> srcJson) => _$CardFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CardToJson(this);

}

  
