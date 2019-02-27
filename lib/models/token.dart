import 'package:json_annotation/json_annotation.dart'; 
  
part 'token.g.dart';


@JsonSerializable()
  class Token extends Object {

  @JsonKey(name: 'access_token')
  String accessToken;

  @JsonKey(name: 'token_type')
  String tokenType;

  @JsonKey(name: 'scope')
  String scope;

  @JsonKey(name: 'created_at')
  int createdAt;

  Token(this.accessToken,this.tokenType,this.scope,this.createdAt,);

  factory Token.fromJson(Map<String, dynamic> srcJson) => _$TokenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

}

  
