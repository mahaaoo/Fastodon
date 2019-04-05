import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/models/my_account.dart';
import 'package:fastodon/models/owner_account.dart';
import 'package:fastodon/models/article_item.dart';
import 'new_article_cell.dart';

class NewArticle extends StatefulWidget {
  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  final TextEditingController _controller = new TextEditingController();
  final TextEditingController _wornController = new TextEditingController();
  OwnerAccount _myAcc;
  bool _worningWords = false;
  Icon _articleRange = Icon(Icons.public, size: 30);
  String _visibility = 'public';

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
    _getEmojis();
  }

  Future<void> _getEmojis() async {
    Request.get(url: Api.CustomEmojis).then((data) {
      print(data);
    });
  }

  Future<void> _getMyAccount() async {
    Request.get(url: Api.OwnerAccount).then((data) {
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
    paramsMap['spoiler_text'] = _wornController.text;
    paramsMap['status'] = _controller.text;
    paramsMap['visibility'] = _visibility;

    Request.post(url: Api.PushNewTooT, params: paramsMap).then((data) {
      ArticleItem newItem = ArticleItem.fromJson(data);
      if(newItem != null) {
        eventBus.emit(EventBusKey.HidePresentWidegt, true);
      }
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
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

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NewArticleCell(
              title: '公开',
              description: '所有人可见，并且会出现在公共时间轴上',
              leftIcon: Icon(Icons.public, size: 30),
              onSelect: (Icon icons) {
                setState(() {
                  _articleRange = icons;
                  _visibility = 'public';
                });
              },
              currentIcon: _articleRange,
            ),
            NewArticleCell(
              title: '不公开',
              description: '所有人可见，但不会出现在公共时间轴上',
              leftIcon: Icon(Icons.vpn_lock, size: 30),
              onSelect: (Icon icons) {
                setState(() {
                  _articleRange = icons;
                  _visibility = 'unlisted';
                });
              },
              currentIcon: _articleRange,
            ),
            NewArticleCell(
              title: '仅关注者',
              description: '只有关注你的用户可以看到',
              leftIcon: Icon(Icons.lock, size: 30),
              onSelect: (Icon icons) {
                setState(() {
                  _articleRange = icons;
                  _visibility = 'private';
                });
              },
              currentIcon: _articleRange,
            ),
            NewArticleCell(
              title: '私信',
              description: '只有被提及的用户可以看到',
              leftIcon: Icon(Icons.sms, size: 30),
              onSelect: (Icon icons) {
                setState(() {
                  _articleRange = icons;
                });
                _visibility = 'direct';
              },
              currentIcon: _articleRange,
            ),
            SizedBox(height: Screen.bottomSafeHeight(context))
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
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
                            Text(StringUntil.displayName(_myAcc), style: TextStyle(fontSize: 16)),
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
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Icon(Icons.photo, size: 30),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            showBottomSheet();
                          },
                          child: _articleRange,
                        ),
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
      ),
    );
  }
}