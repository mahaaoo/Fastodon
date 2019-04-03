import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/models/owner_account.dart';
import 'package:fastodon/widget/avatar.dart';

class SettingHead extends StatelessWidget {
  SettingHead({Key key, this.account}) : super(key: key);
  final OwnerAccount account;

  Widget header(BuildContext context) {
    if (account == null) {
      return Container(
        height: 150,
        color: MyColor.mainColor,
      );
    }
    return Container(
      height: 150,
      color: MyColor.mainColor,
      child: CachedNetworkImage(
        height: 150,
        width: Screen.width(context),
        imageUrl: account.header,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget displayName() {
    if (account == null) {
      return Container();
    }
    return Positioned(
      top: 130,
      left: 100,
      child: Text(account.displayName, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget userName() {
    if (account == null) {
      return Container();
    }
    return Positioned(
      top: 5,
      left: 100,
      child: Text('@' + account.username, style: TextStyle(color: MyColor.greyText, fontSize: 15)),
    );
  }

  Widget headerWidget() {
    if (account == null) {
      return Container();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        headerSection(account.statusesCount,'嘟文'),
        headerSection(account.followingCount, '关注'),
        headerSection(account.followersCount, '粉丝'),
      ],
    );
  }

  Widget headerSection(int number, String title) {
    return Column(
      children: <Widget>[
        Text('$number', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(fontSize: 13, color: MyColor.greyText))
      ],
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 180,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        header(context),
                        Positioned(
                          top: Screen.statusBarHeight(context) + 15,
                          left: 0,
                          width: Screen.width(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('个人中心', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        displayName(),
                      ],
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 30,
                          color: MyColor.widgetDefaultColor,
                        ),
                        userName(),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 40,
                top: 125,
                child: Avatar(url: account.avatar)
              )
            ],
          ),
          Container(
            height: 50,
            color: MyColor.widgetDefaultColor,
            child: headerWidget()
          ),
        ],
      ),
    );
  }
}
