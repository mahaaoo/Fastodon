import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastodon/models/my_account.dart';
import 'package:fastodon/pages/setting/model/owner_account.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fastodon/models/article_item.dart';

class NewArticle extends StatefulWidget {
  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _wornController = new TextEditingController();
  OwnerAccount _myAcc;
  bool _worningWords = false;


  @override
  void initState() {
    super.initState();
    // 隐藏登录弹出页
    MyAccount acc = new MyAccount();
    OwnerAccount accMsg = acc.getAcc();
    if (accMsg == null) {
      _getMyAccount();
    } else {
      setState(() {
        _myAcc = accMsg;
      });
    }
  }

  Future<void> _getMyAccount() async {
    print('new acticle');
    Request.get(url: Api.OwnerAccount, callBack: (data) {
      OwnerAccount account = OwnerAccount.fromJson(data);
      MyAccount saveAcc = new MyAccount();
      saveAcc.setAcc(account);
      setState(() {
        _myAcc = account;
      });
    });
  }

  Future<void> _pushNewToot() async {
    Map<String, dynamic> paramsMap = Map();
    paramsMap['in_reply_to_id'] = null;
    paramsMap['media_ids'] = [];
    paramsMap['sensitive'] = false;
    paramsMap['spoiler_text'] = '';
    paramsMap['status'] = _controller.text;
    paramsMap['visibility'] = 'public';

    Request.post(url: Api.PushNewTooT, params: paramsMap, callBack: (data) {
      ArticleItem newItem = ArticleItem.fromJson(data);
      if(newItem != null) {
        eventBus.emit(EventBusKey.HidePresentWidegt, true);
      }
    });
  }

  Widget worningWidge() {
    if (_worningWords == false) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          width: Screen.width(context) - 60,
          color: MyColor.newArticalTextFieldColor,
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: TextField(
            controller: _wornController,
            decoration: InputDecoration(
              hintText: '折叠部分的警告消息',
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              labelStyle: TextStyle(fontSize: 16)
            ),
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (_myAcc.displayName == '' || _myAcc.displayName.length == 0) {
      displayName = _myAcc.acct;
    } else {
      displayName = _myAcc.displayName;
    }

    return Scaffold(
      body: Container(
        color: MyColor.widgetDefaultColor,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        child: CachedNetworkImage(
                            imageUrl: _myAcc.avatarStatic,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(displayName, style: TextStyle(fontSize: 16)),
                          Text('@' + _myAcc.acct, style: TextStyle(fontSize: 13, color: MyColor.greyText))
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      eventBus.emit(EventBusKey.HidePresentWidegt);
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
            ),
            worningWidge(),
            Container(
              color: MyColor.newArticalTextFieldColor,
              height: 250,
              width: Screen.width(context) - 60,
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                controller: _controller,
                maxLength: 500,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: '有什么新鲜事',
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  labelStyle: TextStyle(fontSize: 16)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.photo, size: 30),
                      SizedBox(width: 10,),
                      Icon(Icons.public, size: 30),
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _worningWords = !_worningWords;
                          });
                        },
                        child: Text('cw', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      )
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_controller.text.length == 0) {
                        Fluttertoast.showToast(
                          msg: "说点什么吧",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIos: 1,
                          backgroundColor: MyColor.error,
                          textColor: MyColor.loginWhite,
                          fontSize: 16.0
                        );
                      } else {
                        _pushNewToot();
                      }
                    },
                    child: Text('TooT!'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}