import 'package:json_annotation/json_annotation.dart'; 
  
part 'media_attachment.g.dart';


@JsonSerializable()
  class MediaAttachment extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'preview_url')
  String previewUrl;

  @JsonKey(name: 'text_url')
  String textUrl;

  @JsonKey(name: 'meta')
  Map meta;

  MediaAttachment(this.id,this.type,this.url,this.previewUrl,this.textUrl, this.meta);

  factory MediaAttachment.fromJson(Map<String, dynamic> srcJson) => _$MediaAttachmentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MediaAttachmentToJson(this);

}

  
