import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:fastodon/public.dart';
import 'model/owner_account.dart';

import 'package:fastodon/widget/avatar.dart';

class UserMessage extends StatefulWidget {
  UserMessage({Key key, @required this.account}) : super(key: key);

  final OwnerAccount account;

  @override
  _UserMessageState createState() => _UserMessageState();

}
class _UserMessageState extends State<UserMessage> {
  int _currentWidget = 0;

  List<Widget> contentList = [
    Center(
      child: Text('11111'),
    ),
    Center(
      child: Text('22222'),
    ),
    Center(
      child: Text('33'),
    ),
  ];

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
                    child: Html(
                      data: widget.account.note,
                      defaultTextStyle: TextStyle(color: MyColor.widgetDefaultColor, fontSize: 15)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget headerSection(int number, String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Text('$number', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
          Text(title, style: TextStyle(fontSize: 13, color: MyColor.greyText))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          userHeader(context),
          Card(),
          DefaultTabController(
            length: 3,
            child: TabBar(
              tabs: [
                headerSection(widget.account.statusesCount,'嘟文'),
                headerSection(widget.account.followingCount, '关注'),
                headerSection(widget.account.followersCount, '粉丝'),
              ],
              onTap: (index) {
                setState(() {
                  _currentWidget = index;
                });
              },
            ),
          ),
          contentList[_currentWidget]
        ],
      ),
    );
  }
}
