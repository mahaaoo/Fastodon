import 'package:json_annotation/json_annotation.dart'; 
  
part 'token_model.g.dart';


@JsonSerializable()
  class TokenModel extends Object {

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'token_type')
  String tokenType;

  @JsonKey(name: 'scope')
  String scope;

  @JsonKey(name: 'created_at')
  int createdAt;

  TokenModel(this.accessToken,this.tokenType,this.scope,this.createdAt,);

  factory TokenModel.fromJson(Map<String, dynamic> srcJson) => _$TokenModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

}
