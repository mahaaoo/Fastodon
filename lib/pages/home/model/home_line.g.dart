// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeLine _$HomeLineFromJson(Map<String, dynamic> json) {
  return HomeLine(
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
      json['application'] == null
          ? null
          : Application.fromJson(json['application'] as Map<String, dynamic>),
      json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      json['media_attachments'] as List,
      json['mentions'] as List,
      json['tags'] as List,
      json['emojis'] as List,
      json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HomeLineToJson(HomeLine instance) => <String, dynamic>{
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
      'application': instance.application,
      'account': instance.account,
      'media_attachments': instance.mediaAttachments,
      'mentions': instance.mentions,
      'tags': instance.tags,
      'emojis': instance.emojis,
      'card': instance.card
    };

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(json['name'] as String);
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{'name': instance.name};

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
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
      json['emojis'] as List,
      json['fields'] as List);
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
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
      'emojis': instance.emojis,
      'fields': instance.fields
    };

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
      json['url'] as String,
      json['title'] as String,
      json['description'] as String,
      json['type'] as String,
      json['author_name'] as String,
      json['author_url'] as String,
      json['provider_name'] as String,
      json['provider_url'] as String,
      json['html'] as String,
      json['width'] as int,
      json['height'] as int,
      json['image'] as String,
      json['embed_url'] as String);
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'author_name': instance.authorName,
      'author_url': instance.authorUrl,
      'provider_name': instance.providerName,
      'provider_url': instance.providerUrl,
      'html': instance.html,
      'width': instance.width,
      'height': instance.height,
      'image': instance.image,
      'embed_url': instance.embedUrl
    };
