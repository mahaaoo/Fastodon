import 'package:flutter/material.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/models/my_account.dart';
import 'model/owner_account.dart';

import 'user_message.dart';
import 'setting_head.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  OwnerAccount _account;
  bool _finishRequest = false;
  ScrollController _scrollController = ScrollController();

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

  List<Function> acountFun = [
    () => {},
    () => {},
    () => {},
    () => {},
    () => {},
    () => {},
  ];

  List<Function> aboutFun = [
    () => {},
    () => {},
    () {
      Storage.removeString(StorageKey.HostUrl);
      Storage.removeString(StorageKey.Token);
    },
  ];


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    eventBus.on(EventBusKey.LoadLoginMegSuccess, (arg) {
      _getMyAccount();
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.LoadLoginMegSuccess);
    super.dispose();
  }

  Future<void> _getMyAccount() async {
    Request.get(url: Api.OwnerAccount, callBack: (data) {
      OwnerAccount account = OwnerAccount.fromJson(data);
      MyAccount saveAcc = new MyAccount();
      saveAcc.setAcc(account);
      setState(() {
        _finishRequest = true;
        _account = account;
      });
    });
  }

  Widget settingItem(List<String> titles, List<Icon> icons, List<Function> funList) {
    List<Widget> _children = [];

    for (var i = 0; i < titles.length; i++) {
      _children.add(
        GestureDetector(
          onTap: () {
            print('执行');
            funList[i]();
          },
          child: Column(
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
          ),
        )
      );
    }

    return Column(
      children: _children
    );
  }

  Widget settingWidget() {
    return RefreshIndicator(
      onRefresh: () => _getMyAccount(),
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        controller: _scrollController,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              AppNavigate.push(context, UserMessage(account: _account,));
            },
            child: SettingHead(
              account: _account,
            )
          ),
          SizedBox(height: 10),
          settingItem(acountTitles, acountIcons, acountFun),
          SizedBox(height: 10),
          settingItem(abountTitles, aboutIcons, aboutFun),
        ],
      ),
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