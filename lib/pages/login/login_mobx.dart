import 'package:fastodon/model/api_response.dart';
import 'package:fastodon/model/app_info_model.dart';
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
    print(response.data);
    if (response.data is AppInfoModel) {
      String url = '$hostUrl/oauth/authorize?scope=read%20write%20follow%20push&response_type=code&redirect_uri=${Oauth.RedirectUris}&client_id=${response.data.clientId}';

      NavigatorUtil.pushNamed('OauthWebView', (context) => OauthWebView(hostUrl: url));
    }
    // Request.post(url: '$hostUrl' + Api.Apps, params: paramsMap).then((data) {
    //   AppCredential model = AppCredential.fromJson(data);
    //   setState(() {
    //     _clickButton = false;
    //   });
    //   AppNavigate.push(context, WebLogin(serverItem: model, hostUrl: hostUrl), callBack: (code) {
    //     _getToken(code, model, hostUrl);
    //   });
    // }).catchError(() {
    //   setState(() {
    //     _clickButton = true;
    //   });
    // });
  } 
}
