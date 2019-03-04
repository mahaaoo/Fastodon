import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fastodon/models/article_item.dart';
import 'package:fastodon/public.dart';

class ArticleCell extends StatefulWidget {
  ArticleCell({Key key, this.item}) : super(key: key);
  final ArticleItem item;

  @override
  _ArticleCellState createState() => _ArticleCellState();
}

class _ArticleCellState extends State<ArticleCell> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: ClipRRect(
                child: new CachedNetworkImage(
                    imageUrl: widget.item.account.avatarStatic,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
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
                        Row(
                          children: <Widget>[
                            Baseline(
                              baseline: 20,
                              baselineType: TextBaseline.alphabetic,
                              child: Text(widget.item.account.displayName, style: TextStyle(fontSize: 16)),
                            ),
                            SizedBox(width: 5),
                            Baseline(
                              baseline: 20,
                              baselineType: TextBaseline.alphabetic,
                              child: Text('@' + widget.item.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.more_horiz, color: MyColor.homeIconColor),
                        )
                      ],
                    ),
                    Text('1分钟前',style: TextStyle(fontSize: 13, color: MyColor.greyText)),                
                  ],
                ),
            ),
            )
            
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Html(
            data: widget.item.content,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.reply, color: MyColor.homeIconColor),
            Icon(Icons.repeat, color: MyColor.homeIconColor ),
            Icon(Icons.star, color: MyColor.homeIconColor),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}