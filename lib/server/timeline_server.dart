import 'package:dio/dio.dart';
import 'package:fastodon/model/api_response.dart';
import 'package:fastodon/utils/request/index.dart';

class TimelineServer {
  static Future<ApiResponse<List>> getHomeTimeline() async {
    try {
      String url = '/api/v1/timelines/home';
      final response = await RequestUtils.get(url);
      return ApiResponse.completed(response as List);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
}
