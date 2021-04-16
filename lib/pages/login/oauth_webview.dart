import 'package:fastodon/config/oauth.dart';
import 'package:fastodon/utils/navigator_util.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class OauthWebView extends StatefulWidget {
  OauthWebView({Key key, this.hostUrl}) : super(key: key);

  final String hostUrl;

  @override
  OauthWebViewState createState() => OauthWebViewState();
}

class OauthWebViewState extends State<OauthWebView> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.hostUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            List<String> urlList = request.url.split("?");
            if (urlList[0].contains(Oauth.RedirectUris) && urlList[1].length != 0) {
              List<String> codeList = urlList[1].split("=");
              NavigatorUtil.pop(codeList[1]);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
    );
  }
}
