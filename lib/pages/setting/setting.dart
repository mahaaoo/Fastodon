import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'model/owner_account.dart';
import 'setting_head.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  OwnerAccount _account;
  bool _finishRequest = false;
  ScrollController _scrollController = ScrollController();
  double navAlpha = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    eventBus.on(EventBusKey.StorageSuccess, (arg) {
      _getMyAccount();
    });

    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });

  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.StorageSuccess);
    super.dispose();
  }

  Future<void> _getMyAccount() async {
    Request.get(url: Api.OwnerAccount, callBack: (data) {
      OwnerAccount account = OwnerAccount.fromJson(data);
      setState(() {
        _finishRequest = true;
        _account = account;
      });
    });
  }

  Widget settingItem() {
    List<Widget> _children = [];

    for (var i = 0; i < 50; i++) {
      _children.add(
        Text('asddas')
      );
    }

    return Column(
      children: _children
    );
  }

  Widget buildNavigationBar() {
    return Positioned(
      top: 0,
      left: 0,
      child: Opacity(
        opacity: navAlpha,
        child: Container(
          width: Screen.width(context),
          height: Screen.navigationBarHeight(context),
          color: MyColor.mainColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('个人中心', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      )
    );
  }

  Widget settingWidget() {
    return Stack(
      children: <Widget>[
        ListView(
          padding: EdgeInsets.only(top: 0),
          controller: _scrollController,
          children: <Widget>[
            SettingHead(
              account: _account,
            ),
            settingItem()
          ],
        ),
        buildNavigationBar()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      endLoading: _finishRequest,
      childWidget: settingWidget(),
    );
  }
}