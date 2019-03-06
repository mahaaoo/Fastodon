import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/refresh_load_listview.dart';
import 'model/notificate_item.dart';
import 'follow_cell.dart';
import 'favourite_cell.dart';

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
    eventBus.on(EventBusKey.LoadLoginMegSuccess, (arg) {
      setState(() {
        _canLoadWidget = true;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.LoadLoginMegSuccess);
    super.dispose();
  }

  Widget row(int index, List data) {
    NotificateItem item = NotificateItem.fromJson(data[index]);
    if (item.type == 'follow') {
      return FollowCell(
        item: item,
      );
    } else if (item.type == 'favourite') {
      return FavouriteCell(
        item: item,
      );
    } else {
      return Container();
    }
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