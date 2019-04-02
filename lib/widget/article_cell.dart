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
  bool _favourite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _favourite = widget.item.favourited;
    });
  }

  Future<void> _onPressFavoutite(String url) async {
    setState(() {
      _favourite = !_favourite;
    });
    Request.post(url: url).then((data) {
      ArticleItem newItem = ArticleItem.fromJson(data);
      setState(() {
        _favourite = newItem.favourited;
      });
    }).catchError((onError) {
      setState(() {
        _favourite = !_favourite;
      });
    });
  }

  Widget articleContent() {
    if (widget.item.card != null && widget.item.card.image != null) {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Html(
              data: widget.item.content,
              onLinkTap: (url) {
                Open.url(url);
              },
            ),
            Container(
              color: Colors.grey[50],
              margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
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
            )
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

  Widget favouritedAtion() {
    if(_favourite == true){
      return Icon(Icons.favorite, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: MyColor.timelineUnIconColor);
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
    return GestureDetector(
      onTap: () {
        print('跳转到详情页');
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
                GestureDetector(
                  onTap: () {

                  },
                  child: Icon(Icons.reply, color: MyColor.timelineUnIconColor),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Icon(Icons.repeat, color: MyColor.timelineUnIconColor),
                ),
                GestureDetector(
                  onTap: () {
                    if (_favourite == false) {
                      _onPressFavoutite(Api.FavouritesArticle(widget.item.id));
                    } else {
                      _onPressFavoutite(Api.UnFavouritesArticle(widget.item.id));
                    }
                  },
                  child: favouritedAtion(),
                ),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      )
    );
  }
}