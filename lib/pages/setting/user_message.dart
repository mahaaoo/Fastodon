import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:fastodon/public.dart';
import 'model/owner_account.dart';

import 'package:fastodon/widget/refresh_load_listview.dart';
import 'package:fastodon/widget/article_cell.dart';
import 'package:fastodon/models/article_item.dart';
import 'package:fastodon/models/my_account.dart';
import 'model/relation_ship.dart';
import 'package:fastodon/widget/avatar.dart';
import 'following_list.dart';
import 'follower_list.dart';
import 'user_sheet_cell.dart';

MyAccount mine = new MyAccount();

class UserMessage extends StatefulWidget {
  UserMessage({Key key, @required this.account}) : super(key: key);

  final OwnerAccount account;

  @override
  _UserMessageState createState() => _UserMessageState();

}
class _UserMessageState extends State<UserMessage> {
  int _currentWidget = 0;
  String _bottomSheetTitle = '未关注';
  String _bottomSheetFunName = '关注';
  OwnerAccount _account = mine.account;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState(); 
    _account = widget.account;
    if (mine.account.id != widget.account.id) {
      _getRelationShuips();
    }
  }

  void _changeBottomSheet(RelationShip relate) {
    String title = '';
    String name = '';

    if (relate.followedBy == true && relate.following == true) {
      title = '互相关注';
      name = '取消关注';
    } else if (relate.followedBy == false && relate.following == true) {
      title = '已关注';
      name = '取消关注';
    } else if (relate.followedBy == true && relate.following == false) {
      title = '我的粉丝';
      name = '关注';
    } else if (relate.followedBy == false && relate.following == false) {
      title = '未关注';
      name = '关注';
    } 
    setState(() {
      _bottomSheetTitle = title; 
      _bottomSheetFunName = name; 
    });
  }

  Future<void> _getRelationShuips() async {
    Request.get(url: Api.Relationships, params: { 'id[]' : widget.account.id }).then((data) {
      List response = data;
      RelationShip relate = RelationShip.fromJson(response[0]);
      _changeBottomSheet(relate);
    });
  }

  Future<void> _followByid() async {
    Map paramsMap = Map();
    paramsMap['reblogs'] = true;

    Request.post(url: Api.Follow(widget.account.id), params: paramsMap).then((data) {
      RelationShip relate = RelationShip.fromJson(data);
      if(relate.following == true) {
        // 关注成功
        OwnerAccount mineAccount = mine.account;
        mineAccount.followingCount = mine.account.followingCount + 1;
        mine.setAcc(mineAccount);
      }
      _changeBottomSheet(relate);
    });
  }

  Future<void> _unfollowByid() async {
    Request.post(url: Api.UnFollow(widget.account.id)).then((data) {
      RelationShip relate = RelationShip.fromJson(data);
      if(relate.following == false) {
        // 取关成功
        OwnerAccount mineAccount = mine.account;
        mineAccount.followingCount = mine.account.followingCount - 1;
        mine.setAcc(mineAccount);
      }
      _changeBottomSheet(relate);
    });
  }

  Widget header(BuildContext context) {
    if (widget.account == null) {
      return Container(
        height: 200,
        color: MyColor.mainColor,
      );
    }
    return Container(
      color: MyColor.mainColor,
      child: CachedNetworkImage(
        height: 200,
        width: Screen.width(context),
        imageUrl: widget.account.header,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget more(BuildContext context) {
    if (mine.account.id == widget.account.id) {
      return Container();
    }
    return Positioned(
      top: 50,
      right: 20,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return new Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Center(
                      child: Text(_bottomSheetTitle, style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                    ),
                  ),
                  UserSheetCell(
                    title: '提及',
                  ),
                  UserSheetCell(
                    title: '私信',
                  ),
                  UserSheetCell(
                    title: '隐藏',
                  ),
                  UserSheetCell(
                    title: '屏蔽',
                  ),
                  UserSheetCell(
                    title: '举报',
                  ),
                  UserSheetCell(
                    title: _bottomSheetFunName,
                    onPress: () {
                      if (_bottomSheetFunName == '关注') {
                        _followByid();
                      }
                      if (_bottomSheetFunName == '取消关注') {
                        _unfollowByid();
                      }
                    },
                  ),
                  SizedBox(height: 20)
                ],
              );
            }
          );
        },
        child: Icon(Icons.more_horiz , color: Colors.white),
      )
    );
  }

  Widget userHeader(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            header(context),
            Positioned(
              top: 50,
              width: Screen.width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Avatar(url: widget.account.avatar),
                  SizedBox(height: 5),
                  Text(
                    widget.account.displayName, 
                    style: TextStyle(color: MyColor.widgetDefaultColor, fontSize: 15),
                  ),
                  Container(
                    width: Screen.width(context) - 60,
                    child: Center(
                      child: Html(
                        data: widget.account.note,
                        defaultTextStyle: TextStyle(color: MyColor.widgetDefaultColor, fontSize: 15)
                      ),
                    )
                  )
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  AppNavigate.pop(context);
                },
                child: Icon(Icons.arrow_back_ios , color: Colors.white),
              )
            ),
            more(context),
          ],
        ),
      ],
    );
  }

  Widget headerSection(BuildContext context, int number, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Text('$number', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
          Text(title, style: TextStyle(fontSize: 13, color: MyColor.greyText))
        ],
      ),
    );
  }

  Widget row(int index, List data) {
    ArticleItem lineItem = ArticleItem.fromJson(data[index]);
    return ArticleCell(item: lineItem);
  }

  Widget contentView(int index) {
    switch (index) {
      case 0:
        return RefreshLoadListView(
          requestUrl: Api.UersArticle(widget.account.id, 'exclude_replies=true'),
          buildRow: row,
        );
        break;
      case 1:
        return FollowingList(
          url: Api.Following(widget.account.id),
        );
        break;
      case 2:
        return FollowerList(
          url: Api.Follower(widget.account.id),
        );
        break;
      default: 
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          userHeader(context),
          DefaultTabController(
            length: 3,
            child: Container(
              color: Colors.white,
              child: TabBar(
                tabs: [
                  headerSection(context, _account.statusesCount,'嘟文'),
                  headerSection(context, _account.followingCount, '关注'),
                  headerSection(context, _account.followersCount, '粉丝'),
                ],
                onTap: (index) {
                  setState(() {
                    _currentWidget = index;
                  });
                },
              ),
            )
          ),
          Expanded(
            child: contentView(_currentWidget),
          )
        ],
      ),
    );
  }
}
