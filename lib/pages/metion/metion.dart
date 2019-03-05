import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/refresh_load_listview.dart';

class Metion extends StatefulWidget {
  @override
  _MetionState createState() => _MetionState();
}

class _MetionState extends State<Metion> with AutomaticKeepAliveClientMixin {
  bool _canLoadWidget = false;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 隐藏登录弹出页
    eventBus.on(EventBusKey.StorageSuccess, (arg) {
      setState(() {
        _canLoadWidget = true;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.StorageSuccess);
    super.dispose();
  }

  Widget row(int index, List data) {
    return Text('data' + '$index');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通知'),
      ),
      body: LoadingWidget(
        endLoading: _canLoadWidget,
        childWidget: RefreshLoadListView(
          requestUrl: Api.Notifications,
          buildRow: row,
        ),
      )
    );
  }
}