import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fastodon/public.dart';

import 'package:fastodon/models/my_account.dart';
import 'model/owner_account.dart';

import 'user_message.dart';
import 'setting_head.dart';
import 'setting_cell.dart';
import 'about_app.dart';
import 'favourites_article.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> with AutomaticKeepAliveClientMixin {
  OwnerAccount _account;
  bool _finishRequest = false;
  ScrollController _scrollController = ScrollController();

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
    Request.get(url: Api.OwnerAccount).then((data) {
      OwnerAccount account = OwnerAccount.fromJson(data);
      MyAccount saveAcc = new MyAccount();
      saveAcc.setAcc(account);
      setState(() {
        _finishRequest = true;
        _account = account;
      });
    });
  }

  void showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("提示"),
          content: Text("确定要退出登录"),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              }
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("确定"),
              onPressed: () {
                Storage.removeString(StorageKey.HostUrl);
                Storage.removeString(StorageKey.Token);
                Navigator.pop(context, 'Cancel');
              }
            )
          ],
        );
      }
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
          SettingCell(
            title: '我的收藏',
            leftIcon: Icon(Icons.star),
            onPress: () => AppNavigate.push(context, FavoutitesArticle()),
          ),
          SettingCell(
            title: '请求关注列表',
            leftIcon: Icon(Icons.people),
            onPress: () => {},
          ),
          SettingCell(
            title: '静音用户',
            leftIcon: Icon(Icons.volume_off),
            onPress: () => {},
          ),
          SettingCell(
            title: '黑名单',
            leftIcon: Icon(Icons.not_interested), 
            onPress: () => {},
          ),
          SettingCell(
            title: '切换主题',
            leftIcon: Icon(Icons.wb_sunny),
            onPress: () => {},
          ),
          SettingCell(
            title: 'App设置',
            leftIcon: Icon(Icons.settings_input_svideo),
            onPress: () => {},
          ),
          SizedBox(height: 10),
          SettingCell(
            title: '关于本站',
            leftIcon: Icon(Icons.attachment),
            onPress: () => {},
          ),
          SettingCell(
            title: '关于App',
            leftIcon: Icon(Icons.bubble_chart),
            onPress: () => AppNavigate.push(context, AboutApp()),
          ),
          SettingCell(
            title: '退出',
            leftIcon: Icon(Icons.exit_to_app),
            onPress: () {
              showAlert();
            },
          ),
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