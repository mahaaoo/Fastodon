import 'package:flutter/material.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/pages/setting/model/owner_account.dart';
import 'package:fastodon/widget/avatar.dart';

import 'package:fastodon/pages/setting/user_message.dart';

class FollowCell extends StatefulWidget {
  FollowCell({Key key, this.item}) : super(key: key);
  final OwnerAccount item;

  @override
  _FollowCellState createState() => _FollowCellState();
}

class _FollowCellState extends State<FollowCell> {
  @override
  Widget build(BuildContext context) {
    String displayName = '';
    if (widget.item.displayName == '' || widget.item.displayName.length == 0) {
      displayName = widget.item.acct;
    } else {
      displayName = widget.item.displayName;
    }
    return GestureDetector(
      onTap: () {
        AppNavigate.push(context, UserMessage(account: widget.item));
      },
      child: Container(
        color: MyColor.widgetDefaultColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Avatar(url: widget.item.avatar)
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(displayName, style: TextStyle(fontSize: 16)),
                    Text('@' + widget.item.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                  ],
                )
              ],
            ),
          ],
        )
      ),
    );
  }
}