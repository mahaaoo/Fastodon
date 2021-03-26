import 'package:dio/dio.dart';

import 'package:fastodon/utils/index.dart';
import 'package:fastodon/model/api_response.dart';
import 'package:fastodon/model/app_info_model.dart';

class AppServer {
  // 获取App信息 
  static Future<ApiResponse<AppInfoModel>> postApps(String hostUrl, Map<String, dynamic> params) async {
    try {
      String url = hostUrl + '/api/v1/apps';
      final response = await RequestUtils.post(url, params: params);
      AppInfoModel data = AppInfoModel.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }
} 
