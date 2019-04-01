import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/pages/setting/user_message.dart';
import 'package:fastodon/models/article_item.dart';
import 'avatar.dart';

class ArticleCell extends StatefulWidget {
  ArticleCell({Key key, this.item}) : super(key: key);
  final ArticleItem item;

  @override
  _ArticleCellState createState() => _ArticleCellState();
}

class _ArticleCellState extends State<ArticleCell> {

  Widget articleContent() {
    if (widget.item.card != null && widget.item.card.image != null) {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Html(
              data: widget.item.content,
              onLinkTap: (url) {
                print('点击到的链接：' + url);
              },
            ),
            SizedBox(height: 15),
            CachedNetworkImage(
              imageUrl: widget.item.card.image,
              fit: BoxFit.cover,
            ),
          ],
        )
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Html(
          data: widget.item.content,
          onLinkTap: (url) {
            print('点击到的链接：' + url);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (widget.item.account.displayName == '' || widget.item.account.displayName.length == 0) {
      displayName = widget.item.account.acct;
    } else {
      displayName = widget.item.account.displayName;
    }
    return Container(
      color: MyColor.widgetDefaultColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: GestureDetector(
                  onTap: () {
                    AppNavigate.push(context, UserMessage(account: widget.item.account));
                  },
                  child: Avatar(url: widget.item.account.avatarStatic),
                )
              ),
              Expanded(
                child: Container(
                height: 50,
                margin: EdgeInsets.only(top: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(displayName, style: TextStyle(fontSize: 16)),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(Icons.keyboard_arrow_down , color: MyColor.timelineUnIconColor),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('@' + widget.item.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Text(DateUntil.dateTime(widget.item.createdAt) ,style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                          )
                        ],
                      )
                    ],
                  ),
              ),
              )
            ],
          ),
          articleContent(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(Icons.reply, color: MyColor.timelineUnIconColor),
              Icon(Icons.repeat, color: MyColor.timelineUnIconColor),
              Icon(Icons.favorite_border, color: MyColor.timelineUnIconColor),
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}