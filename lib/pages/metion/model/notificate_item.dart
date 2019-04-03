import 'package:json_annotation/json_annotation.dart'; 
import 'package:fastodon/models/owner_account.dart';
import 'package:fastodon/models/article_item.dart';

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
  ArticleItem status;

  NotificateItem(this.id,this.type,this.createdAt,this.account,this.status,);

  factory NotificateItem.fromJson(Map<String, dynamic> srcJson) => _$NotificateItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NotificateItemToJson(this);

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
