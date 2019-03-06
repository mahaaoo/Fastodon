import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'model/owner_account.dart';
import 'setting_head.dart';
import 'package:fastodon/models/account.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  OwnerAccount _account;
  bool _finishRequest = false;
  ScrollController _scrollController = ScrollController();
  // double navAlpha = 0;
  List<String> acountTitles = ['我的收藏', '请求关注列表', '静音用户','黑名单','切换主题', 'App设置'];
  List<String> abountTitles = ['关于本站', '关于App', '退出'];

  List<Icon> acountIcons = [
    Icon(Icons.star),
    Icon(Icons.people),
    Icon(Icons.volume_off),
    Icon(Icons.not_interested), 
    Icon(Icons.wb_sunny),
    Icon(Icons.settings_input_svideo),//brightness_4 
  ];

  List<Icon> aboutIcons = [
    Icon(Icons.attachment),
    Icon(Icons.bubble_chart),
    Icon(Icons.exit_to_app)
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    eventBus.on(EventBusKey.LoadLoginMegSuccess, (arg) {
      _getMyAccount();
    });

    // _scrollController.addListener(() {
    //   var offset = _scrollController.offset;
    //   if (offset < 0) {
    //     if (navAlpha != 0) {
    //       setState(() {
    //         navAlpha = 0;
    //       });
    //     }
    //   } else if (offset < 50) {
    //     setState(() {
    //       navAlpha = 1 - (50 - offset) / 50;
    //     });
    //   } else if (navAlpha != 1) {
    //     setState(() {
    //       navAlpha = 1;
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.LoadLoginMegSuccess);
    super.dispose();
  }

  Future<void> _getMyAccount() async {
    Request.get(url: Api.OwnerAccount, callBack: (data) {
      OwnerAccount account = OwnerAccount.fromJson(data);
      Account saveAcc = new Account();
      saveAcc.setAcc(account);
      setState(() {
        _finishRequest = true;
        _account = account;
      });
    });
  }

  Widget settingItem(List<String> titles, List<Icon> icons) {
    List<Widget> _children = [];

    for (var i = 0; i < titles.length; i++) {
      _children.add(
        Column(
          children: <Widget>[
             Container(
              color: MyColor.widgetDefaultColor,
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      icons[i],
                      SizedBox(width: 10),
                      Text(titles[i], style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50),
              child: Divider(height: 1.0, color: MyColor.dividerLineColor),
            )
          ],
        )
       
      );
    }

    return Column(
      children: _children
    );
  }

  // Widget buildNavigationBar() {
  //   return Positioned(
  //     top: 0,
  //     left: 0,
  //     child: Opacity(
  //       opacity: navAlpha,
  //       child: Container(
  //         width: Screen.width(context),
  //         height: Screen.navigationBarHeight(context),
  //         color: MyColor.mainColor,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Text('个人中心', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
  //           ],
  //         ),
  //       ),
  //     )
  //   );
  // }

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
            SizedBox(height: 10),
            settingItem(acountTitles, acountIcons),
            SizedBox(height: 10),
            settingItem(abountTitles, aboutIcons),
          ],
        ),
        // buildNavigationBar()
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