import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/models/app_credential.dart';
import 'package:fastodon/models/server_item.dart';
import 'package:fastodon/models/token.dart';

import 'server_list.dart';
import 'web_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = new TextEditingController();
  bool _clickButton = false;

  @override
  void initState() {
    super.initState();
    // 隐藏登录弹出页
    eventBus.on(EventBusKey.SelectedServer, (arg) {
      ServerItem item = arg;
      if(item !=null) {
        _controller.text = item.name;
        _checkInputText();
      }
    });
  }

// 请求app的信息
  Future<void> _postApps(String hostUrl) async {
    setState(() {
      _clickButton = true;
    });

    Map paramsMap = Map();
    paramsMap['client_name'] = 'fastodon';
    paramsMap['redirect_uris'] = 'https://mah93.github.io';
    paramsMap['scopes'] = 'read write follow push';

    Request.post(url: '$hostUrl/api/v1/apps', params: paramsMap, callBack: (data) {
      AppCredential model = AppCredential.fromJson(data);
      setState(() {
        _clickButton = false;
      });
      AppNavigate.push(context, WebLogin(serverItem: model, hostUrl: hostUrl), callBack: (code) {
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

// 获取token，此后的每次请求都需带上此token
  Future<void> _getToken(String code, AppCredential serverItem, String hostUrl) async {
    Map<String, dynamic> paramsMap = Map();
    paramsMap['client_id'] = serverItem.clientId;
    paramsMap['client_secret'] = serverItem.clientSecret;
    paramsMap['grant_type'] = 'authorization_code';
    paramsMap['code'] = code;
    paramsMap['redirect_uri'] = serverItem.redirectUri;

    Request.post(url: '$hostUrl/oauth/token', params: paramsMap, callBack: (data) {
      Token getToken = Token.fromJson(data);      
      String token = '${getToken.tokenType} ${getToken.accessToken}';
      Storage.save(StorageKey.Token, token);
      Storage.save(StorageKey.HostUrl, hostUrl);
      eventBus.emit(EventBusKey.LoginSuccess);
    });
  }

  void _checkInputText() {
    if(_controller.text == null || _controller.text.length == 0) {
      return;
    }
    String hostUrl = 'https://${_controller.text}';
    _postApps(hostUrl);
  }

// 跳转到选择节点页面
  void _chooseServer(BuildContext context) {
    AppNavigate.push(context, ServerList());
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

  void _showAboutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: 50,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: MyColor.gray
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text('Mastodon（官方中文译万象，网民又称长毛象）是一个免费开源的去中心化的分布式微博客社交网络。它的用户界面和操作方式跟推特类似，但是整个网络并非由单一机构运作，却是由多个由不同营运者独立运作的服务器以联邦方式交换数据而组成的去中心化社交网络。'),
              )
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
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
                      _showAboutSheet(context);
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
