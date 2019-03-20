import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:fastodon/public.dart';
import 'model/owner_account.dart';

import 'package:fastodon/widget/refresh_load_listview.dart';
import 'package:fastodon/widget/article_cell.dart';
import 'package:fastodon/models/article_item.dart';
import 'package:fastodon/widget/avatar.dart';
import 'following_list.dart';
import 'follower_list.dart';

class UserMessage extends StatefulWidget {
  UserMessage({Key key, @required this.account}) : super(key: key);

  final OwnerAccount account;

  @override
  _UserMessageState createState() => _UserMessageState();

}
class _UserMessageState extends State<UserMessage> {
  int _currentWidget = 0;

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
            )
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
                  headerSection(context, widget.account.statusesCount,'嘟文'),
                  headerSection(context, widget.account.followingCount, '关注'),
                  headerSection(context, widget.account.followersCount, '粉丝'),
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
