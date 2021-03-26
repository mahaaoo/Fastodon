import 'package:fastodon/utils/navigator_util.dart';
import 'package:flutter/material.dart';

import 'login_mobx.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = new TextEditingController();
  final LoginMobx store = new LoginMobx();

  void _checkInputText() {
    if(_controller.text == null || _controller.text.length == 0) {
      return;
    }
    String hostUrl = 'https://${_controller.text}';
    store.postApps(hostUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: new InputDecoration(
                hintText: '例如：cmx.im',
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                labelStyle: TextStyle(fontSize: 16)
              ),
            ),
            ElevatedButton(
              child: Text('登录'),
              onPressed: () {
                // NavigatorUtil.pushNamed('OauthWebView');
                _checkInputText();
              }
            )
          ],
        ),
      ),
    );
  }
}
