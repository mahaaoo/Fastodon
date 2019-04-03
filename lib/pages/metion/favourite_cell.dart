import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:fastodon/public.dart';

import 'model/notificate_item.dart';
import 'package:fastodon/widget/avatar.dart';

class FavouriteCell extends StatelessWidget {
  FavouriteCell({Key key, @required this.item}) : super(key: key);
  final NotificateItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.widgetDefaultColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 80,
                child: Center(
                  child: Icon(Icons.favorite, color: Colors.red,),
                ),
              ),
              Expanded(
                child: Text(StringUntil.displayName(item.status.account) + '收藏了你的嘟文', style: TextStyle(fontSize: 14),),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 80,
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Avatar(url: item.status.account.avatar)
                  ),
                  Positioned(
                    left: 40,
                    top: 40,
                    child: Avatar(url: item.status.account.avatar, height: 30, width: 30)
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(StringUntil.displayName(item.status.account), style: TextStyle(fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('@' + item.status.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text(DateUntil.dateTime(item.status.createdAt),style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Html(
              data: item.status.content,
            ),  
          )
        ],
      ),
    );
  }
}
