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
    return Container(
      child: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
