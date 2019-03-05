import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'model/notificate_item.dart';
import 'package:fastodon/public.dart';


class FollowCell extends StatelessWidget {
  FollowCell({Key key, @required this.item}) : super(key: key);
  final NotificateItem item;

  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (item.account.displayName == '' || item.account.displayName.length == 0) {
      displayName = item.account.acct;
    } else {
      displayName = item.account.displayName;
    }

    return Container(
      color: MyColor.widgetDefaultColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(80, 10, 0, 0),
            child: Text(item.account.displayName + '开始关注你了', style: TextStyle(fontSize: 16),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: ClipRRect(
                      child: CachedNetworkImage(
                          imageUrl: item.account.avatar,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(displayName, style: TextStyle(fontSize: 16)),
                      Text('@' + item.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text('关注', style: TextStyle(color: MyColor.mainColor),),
              )
            ],
          )
        ],
      ),
    );
  }
}

