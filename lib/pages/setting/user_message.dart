import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/public.dart';
import 'model/owner_account.dart';

import 'package:fastodon/widget/avatar.dart';

class UserMessage extends StatelessWidget {
  UserMessage({Key key, @required this.account}) : super(key: key);

  final OwnerAccount account;

  Widget header(BuildContext context) {
    if (account == null) {
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
        imageUrl: account.header,
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
              child: Column(
                children: <Widget>[
                  Avatar(url: account.avatar)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.widgetDefaultColor,
      child: Column(
        children: <Widget>[
          userHeader(context)
        ],
      ),
    );
  }
}
