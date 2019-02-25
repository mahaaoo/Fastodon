import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fastodon/untils/request.dart';
import 'package:fastodon/untils/app_navigate.dart';
import 'package:fastodon/untils/my_color.dart';

import 'package:fastodon/models/app_credential.dart';
import 'server_list.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {

  Future<void> _postApps() async {
    Map paramsMap = Map();
    paramsMap['client_name'] = 'fastodon';
    paramsMap['redirect_uris'] = 'https://mah93.github.io';
    paramsMap['scopes'] = 'read write follow push';

    Request.post(url: 'https://cmx.im/api/v1/apps', params: paramsMap, callBack: (data) {
      AppCredential model =AppCredential.fromJson(data);
      print(model.clientId);
      print(model.clientSecret);
    });
  }

  void _chooseServer(context) {
    AppNavigate.push(context, ServerList());
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();

    return Scaffold(
      backgroundColor: MyColor.primary,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                    child: Text('Mastodon', style: TextStyle(fontSize: 20, color: MyColor.white)),
                  ),
              )
            ),
            Image.asset('image/wallpaper.png'),
            Card(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
              elevation: 5,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('域名', style: TextStyle(fontSize: 16))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _controller,
                        decoration: new InputDecoration(
                          hintText: '例如：cmx.im',
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          labelStyle: TextStyle(fontSize: 16)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(child:
                     RaisedButton(
                      onPressed: (){
                        print("立即登录");
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                        child: Text('登录Mastodon账号', style:TextStyle(fontSize: 16, color:  MyColor.primary))
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                _chooseServer(context);
              },
              child: Container(
                child: Center(
                  child: Text('什么是域名', style: TextStyle(color: MyColor.white)),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

            // GestureDetector(
            //   onTap: () {
            //     _postApps();
            //   },
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(5)),
            //       color: Colors.white
            //     ),
            //     width: _screenWidth - 50,
            //     height: 40,
            //     child: Center(
            //       child: Text('登录Mastodon账号', style:TextStyle(fontSize: 18, color:  Color.fromRGBO(115, 167, 238, 1)))
            //     ),
            //   ),
            // ),