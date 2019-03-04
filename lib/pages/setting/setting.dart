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

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    eventBus.on(EventBusKey.StorageSuccess, (arg) {
      _getMyAccount();
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

  Widget settingWidget() {
    return SettingHead(
      account: _account,
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