import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fastodon/untils/request.dart';
import 'package:fastodon/untils/app_navigate.dart';
import 'package:fastodon/untils/my_color.dart';
import 'package:fastodon/untils/local_storage.dart';

import 'package:fastodon/constant/storage_key.dart';

import 'package:fastodon/models/app_credential.dart';
import 'package:fastodon/models/server_item.dart';
import 'package:fastodon/models/token.dart';
import 'server_list.dart';
import 'web_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {
  final TextEditingController _controller = new TextEditingController();
  bool _clickButton = false;

  Future<void> _postApps(String hostUrl) async {
    Map paramsMap = Map();
    paramsMap['client_name'] = 'fastodon';
    paramsMap['redirect_uris'] = 'https://mah93.github.io';
    paramsMap['scopes'] = 'read write follow push';

    Request.post(url: '$hostUrl/api/v1/apps', params: paramsMap, callBack: (data) {
      AppCredential model = AppCredential.fromJson(data);
      setState(() {
        _clickButton = false;
      });
      AppNavigate.push(context, WebLogin(serverItem: model, hostUrl: hostUrl), callBack: (String code) {
        _getToken(code, model, hostUrl);
      });
    }, errorCallBack: (error) {
      setState(() {
        _clickButton = false;
      });
      Fluttertoast.showToast(
        msg: "不存在该节点",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: MyColor.error,
        textColor: MyColor.white,
        fontSize: 16.0
      );
    });
  }

  Future<void> _getToken(String code, AppCredential serverItem, String hostUrl) async {
   showDialog(
      context: context,
      child: SimpleDialog(
        contentPadding: EdgeInsets.all(10.0),
        title: SpinKitCircle(
          color: MyColor.primary,
          size: 40,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("登录中", style: TextStyle(fontSize: 15),)
            ],
          )
        ],
    ));

    Map<String, dynamic> paramsMap = Map();
    paramsMap['client_id'] = serverItem.clientId;
    paramsMap['client_secret'] = serverItem.clientSecret;
    paramsMap['grant_type'] = 'authorization_code';
    paramsMap['code'] = code;
    paramsMap['redirect_uri'] = serverItem.redirectUri;

    Request.post(url: '$hostUrl/oauth/token', params: paramsMap, callBack: (data) {
      print('请求成功');
      Token getToken = Token.fromJson(data);      
      String token = '${getToken.tokenType} ${getToken.accessToken}';
      print(token);
      Storage.save(StorageKey.Token, token);
      Storage.save(StorageKey.HostUrl, hostUrl);
      AppNavigate.pop(context);
    });
  }

  void _checkInputText() {
    if(_controller.text == null || _controller.text.length == 0) {
      return;
    }
    setState(() {
      _clickButton = true;
    });
    String hostUrl = 'https://${_controller.text}';
    _postApps(hostUrl);
  }

  void _chooseServer(BuildContext context) {
    AppNavigate.push(context, ServerList(), callBack: (ServerItem item) {
      if (item != null) {
        _controller.text = item.name;
        _checkInputText();
      }
    });
  }

  Widget _showButtonLoading(BuildContext context) {
    if (_clickButton) {
      return SpinKitThreeBounce(
        color: MyColor.primary,
        size: 23,
      );
    }
    return Text('登录Mastodon账号', style:TextStyle(fontSize: 16, color:  MyColor.primary));
  }

  @override
  Widget build(BuildContext context) {
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
                        _checkInputText();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: _showButtonLoading(context), 
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('显示一个关于我们');
                    },
                    child: Container(
                      child: Center(
                        child: Text('关于Mastodon', style: TextStyle(color: MyColor.white)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _chooseServer(context);
                    },
                    child: Container(
                      child: Center(
                        child: Text('选择域名', style: TextStyle(color: MyColor.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
