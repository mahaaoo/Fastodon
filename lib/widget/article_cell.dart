import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/pages/setting/user_message.dart';
import 'package:fastodon/models/article_item.dart';
import 'package:fastodon/pages/home/article_detail.dart';
import 'avatar.dart';
import 'article_cell_toolbar.dart';
import 'article_media.dart';

class ArticleCell extends StatefulWidget {
  ArticleCell({Key key, this.item}) : super(key: key);
  final ArticleItem item;

  @override
  _ArticleCellState createState() => _ArticleCellState();
}

class _ArticleCellState extends State<ArticleCell> {
  Widget articleMedia() {
    if (widget.item.card != null && widget.item.card.image != null) {
      return Container(
        padding: EdgeInsets.all(15),
        color: Colors.grey[50],
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: widget.item.card.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.item.card.title, 
                    style: TextStyle(fontSize: 15),
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(widget.item.card.providerName, style: TextStyle(fontSize: 13, color: MyColor.greyText))
                ],
              ),
            ),
          ],
        ),
      );
    } else if(widget.item.mediaAttachments != null && widget.item.mediaAttachments.length != 0) {
      return ArticleMedia(
        itemList: widget.item.mediaAttachments,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigate.push(context, ArticleDetail(item: widget.item));
      },
      child: Container(
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
                            Text(StringUntil.displayName(widget.item.account), style: TextStyle(fontSize: 16)),
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
            Padding(
              padding: EdgeInsets.all(15),
              child: Html(
                data: widget.item.content,
                onLinkTap: (url) {
                  print('点击到的链接：' + url);
                },
              ),
            ),
            articleMedia(),
            ArticleCellToolbar(
              item: widget.item,
            ),
            SizedBox(height: 10)
          ],
        ),
      )
    );
  }
}