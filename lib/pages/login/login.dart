import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fastodon/untils/screen.dart';
import 'package:fastodon/untils/request.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {

  Future<void> _postApps() async {
    Map paramsMap = Map();
    paramsMap['client_name'] = 'fastodon';
    paramsMap['redirect_uris'] = 'https://mah93.github.io';
    paramsMap['scopes'] = 'read write';

    Request.post('https://cmx.im/api/v1/apps', paramsMap,(data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    final _screenWidth = Screen.width(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(115, 167, 238, 1),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                    child: Text('Mastodon', style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
              )
            ),
            Image.asset('image/wallpaper.png'),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('域名', style: TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                  Container(
                    width: _screenWidth - 80,
                    child: TextField(
                      controller: _controller,
                      decoration: new InputDecoration(
                        hintText: '例如：cmx.im',
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _postApps();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white
                ),
                width: _screenWidth - 50,
                height: 40,
                child: Center(
                  child: Text('登录Mastodon账号', style:TextStyle(fontSize: 18, color:  Color.fromRGBO(115, 167, 238, 1), fontWeight: FontWeight.bold))
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                print('什么域名');
              },
              child: Container(
                child: Center(
                  child: Text('什么是域名', style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}