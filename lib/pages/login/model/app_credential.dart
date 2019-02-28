import 'package:json_annotation/json_annotation.dart'; 
  
part 'app_credential.g.dart';

@JsonSerializable()
  class AppCredential extends Object {

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

  AppCredential(this.id,this.name,this.redirectUri,this.clientId,this.clientSecret,this.vapidKey,);

  factory AppCredential.fromJson(Map<String, dynamic> srcJson) => _$AppCredentialFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AppCredentialToJson(this);

}

  
