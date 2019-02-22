import 'package:json_annotation/json_annotation.dart'; 
  
part 'server_item.g.dart';


@JsonSerializable()
class ServerItem extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'checked_at')
  String checkedAt;

  @JsonKey(name: 'uptime')
  int uptime;

  @JsonKey(name: 'up')
  bool up;

  @JsonKey(name: 'dead')
  bool dead;

  @JsonKey(name: 'version')
  String version;

  @JsonKey(name: 'ipv6')
  bool ipv6;

  @JsonKey(name: 'https_score')
  int httpsScore;

  @JsonKey(name: 'https_rank')
  String httpsRank;

  @JsonKey(name: 'obs_score')
  int obsScore;

  @JsonKey(name: 'obs_rank')
  String obsRank;

  @JsonKey(name: 'users')
  String users;

  @JsonKey(name: 'statuses')
  String statuses;

  @JsonKey(name: 'connections')
  String connections;

  @JsonKey(name: 'open_registrations')
  bool openRegistrations;

  @JsonKey(name: 'info')
  Info info;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  @JsonKey(name: 'thumbnail_proxy')
  String thumbnailProxy;

  @JsonKey(name: 'active_users')
  int activeUsers;

  ServerItem(this.id,this.name,this.updatedAt,this.checkedAt,this.uptime,this.up,this.dead,this.version,this.ipv6,this.httpsScore,this.httpsRank,this.obsScore,this.obsRank,this.users,this.statuses,this.connections,this.openRegistrations,this.info,this.thumbnail,this.thumbnailProxy,this.activeUsers,);

  factory ServerItem.fromJson(Map<String, dynamic> srcJson) => _$ServerItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ServerItemToJson(this);

}

  
@JsonSerializable()
  class Info extends Object {

  @JsonKey(name: 'short_description')
  String shortDescription;

  @JsonKey(name: 'full_description')
  String fullDescription;

  @JsonKey(name: 'languages')
  List<String> languages;

  @JsonKey(name: 'other_languages_accepted')
  bool otherLanguagesAccepted;

  @JsonKey(name: 'prohibited_content')
  List<String> prohibitedContent;

  @JsonKey(name: 'categories')
  List<dynamic> categories;

  Info(this.shortDescription,this.fullDescription,this.languages,this.otherLanguagesAccepted,this.prohibitedContent,this.categories,);

  factory Info.fromJson(Map<String, dynamic> srcJson) => _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

}

  
