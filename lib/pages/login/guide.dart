import 'package:flutter/material.dart';

import 'package:fastodon/utils/navigator_util.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key key}) : super(key: key);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: Text('登录'),
              onPressed: () {
                NavigatorUtil.pushNamed('LoginPage');
              }
            )
          ],
        ),
      ),
    );
  }
}
