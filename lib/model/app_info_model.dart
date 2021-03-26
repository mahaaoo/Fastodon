import 'package:json_annotation/json_annotation.dart'; 
  
part 'app_info_model.g.dart';


@JsonSerializable()
  class AppInfoModel extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'redirect_uri')
  String redirectUri;

  @JsonKey(name: 'client_id')
  String clientId;

  @JsonKey(name: 'client_secret')
  String clientSecret;

  @JsonKey(name: 'vapid_key')
  String vapidKey;

  AppInfoModel(this.id,this.name,this.redirectUri,this.clientId,this.clientSecret,this.vapidKey,);

  factory AppInfoModel.fromJson(Map<String, dynamic> srcJson) => _$AppInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppInfoModelToJson(this);

}
