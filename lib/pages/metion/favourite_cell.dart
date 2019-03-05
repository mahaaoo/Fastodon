import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'model/notificate_item.dart';
import 'package:fastodon/public.dart';

class FavouriteCell extends StatelessWidget {
  FavouriteCell({Key key, @required this.item}) : super(key: key);
  final NotificateItem item;

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (item.status.account.displayName == '' || item.status.account.displayName.length == 0) {
      displayName = item.status.account.acct;
    } else {
      displayName = item.status.account.displayName;
    }

    return Container(
      color: MyColor.widgetDefaultColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(80, 10, 0, 0),
            child: Text(item.account.displayName + '收藏了你的嘟文', style: TextStyle(fontSize: 16),),
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
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: item.status.account.avatar,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 40,
                    child: ClipRRect(
                      child: CachedNetworkImage(
                        imageUrl: item.account.avatar,
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  )

                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(displayName, style: TextStyle(fontSize: 16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('@' + item.status.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text('1分钟前',style: TextStyle(fontSize: 13, color: MyColor.greyText)),
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
