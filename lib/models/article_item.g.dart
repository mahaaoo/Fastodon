// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleItem _$ArticleItemFromJson(Map<String, dynamic> json) {
  return ArticleItem(
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
          : OwnerAccount.fromJson(json['account'] as Map<String, dynamic>),
      json['media_attachments'] as List,
      json['mentions'] as List,
      json['tags'] as List,
      json['emojis'] as List,
      json['card'] == null
          ? null
          : Card.fromJson(json['card'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ArticleItemToJson(ArticleItem instance) =>
    <String, dynamic>{
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
