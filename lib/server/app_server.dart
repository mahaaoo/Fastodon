import 'package:dio/dio.dart';
import 'package:fastodon/model/token_model.dart';

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
  // 获取Token信息 
  static Future<ApiResponse<TokenModel>> getToken(String code, AppInfoModel appInfo, String hostUrl) async {
    try {
      Map<String, dynamic> paramsMap = Map();
      paramsMap['client_id'] = appInfo.clientId;
      paramsMap['client_secret'] = appInfo.clientSecret;
      paramsMap['grant_type'] = 'authorization_code';
      paramsMap['code'] = code;
      paramsMap['redirect_uri'] = appInfo.redirectUri;

      String url = hostUrl + '/oauth/token';
      final response = await RequestUtils.post(url, params: paramsMap);
      TokenModel data = TokenModel.fromJson(response);
      return ApiResponse.completed(data);
    } on DioError catch (e) {
      return ApiResponse.error(e.error);
    }
  }

} 
