import 'package:fastodon/model/api_response.dart';
import 'package:fastodon/server/timeline_server.dart';
import 'package:mobx/mobx.dart';

part 'home_mobx.g.dart';

class HomeMobx = _HomeMobx with _$HomeMobx;

abstract class _HomeMobx with Store {
  @observable List dataSource = [];

  void getHomeLine() async {
    ApiResponse response = await TimelineServer.getHomeTimeline();
    
  } 
}
