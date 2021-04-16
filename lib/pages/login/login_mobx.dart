import 'package:fastodon/config/storage_key.dart';
import 'package:fastodon/model/api_response.dart';
import 'package:fastodon/model/app_info_model.dart';
import 'package:fastodon/model/token_model.dart';
import 'package:fastodon/stores/user.dart';
import 'package:fastodon/utils/storage.dart';
import 'package:mobx/mobx.dart';

import 'package:fastodon/config/oauth.dart';
import 'package:fastodon/server/app_server.dart';
import 'package:fastodon/utils/navigator_util.dart';

import 'package:fastodon/pages/login/oauth_webview.dart';

part 'login_mobx.g.dart';

class LoginMobx = _LoginMobx with _$LoginMobx;

abstract class _LoginMobx with Store {

 // 请求app的信息
  void postApps(String hostUrl) async {
    Map paramsMap = Map<String, dynamic>();
    paramsMap['client_name'] = Oauth.ClientName;
    paramsMap['redirect_uris'] = Oauth.RedirectUris;
    paramsMap['scopes'] = Oauth.Scopes;

    ApiResponse<AppInfoModel> response = await AppServer.postApps(hostUrl, paramsMap);
    if (response.data is AppInfoModel) {
      String url = '$hostUrl/oauth/authorize?scope=read%20write%20follow%20push&response_type=code&redirect_uri=${Oauth.RedirectUris}&client_id=${response.data.clientId}';

      NavigatorUtil.pushNamed('OauthWebView', builder: (context) => OauthWebView(hostUrl: url), callBack: (String code) {
        getToken(code, response.data, hostUrl);
      });
    }
  } 

 // 请求token信息
  void getToken(String code, AppInfoModel appInfo, String hostUrl) async {
    ApiResponse<TokenModel> response = await AppServer.getToken(code, appInfo, hostUrl);
    if (response.data is TokenModel) {
      Storage.save(key: StorageKey.TOKEN, value: response.data.accessToken);
      Storage.save(key: StorageKey.HOST_URL, value: hostUrl);

      User user = new User();
      user.setHost(hostUrl);
      user.setToken(response.data.accessToken);

      NavigatorUtil.pushNamedAndRemoveUntil('RootPage');
    }
  } 
}
