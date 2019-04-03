import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/models/article_item.dart';
import 'package:fastodon/widget/avatar.dart';
import 'package:fastodon/pages/setting/user_message.dart';
import 'package:fastodon/widget/article_cell_toolbar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleDetail extends StatelessWidget {
  ArticleDetail({
    Key key, 
    this.item,
  }) : super(key: key);
  final ArticleItem item;

  Widget articleContent(BuildContext context) {
    if (item.card != null && item.card.image != null) {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Html(
              data: item.content,
              onLinkTap: (url) {
                Open.url(url);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: CachedNetworkImage(
                imageUrl: item.card.image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.grey[50],
              width: Screen.width(context) - 30,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.card.title, 
                    style: TextStyle(fontSize: 15),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(item.card.providerName, style: TextStyle(fontSize: 13, color: MyColor.greyText))
                ],
              ),
            )
          ],
        )
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Html(
          data: item.content,
          onLinkTap: (url) {
            print('点击到的链接：' + url);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嘟文'),
        centerTitle: true,
        backgroundColor: MyColor.mainColor,
      ),
      body: Container(
        color: MyColor.widgetDefaultColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: GestureDetector(
                    onTap: () {
                      AppNavigate.push(context, UserMessage(account: item.account));
                    },
                    child: Avatar(url: item.account.avatarStatic),
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
                            Text(StringUntil.displayName(item.account), style: TextStyle(fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('@' + item.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            articleContent(context),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 15),
              child: Text(DateUntil.dateTime(item.createdAt), style: TextStyle(fontSize: 13, color: MyColor.greyText)),
            ),
            ArticleCellToolbar(
              item: item,
            ),
            SizedBox(height: 10)
          ]
        ),
      ),
    );
  }
}