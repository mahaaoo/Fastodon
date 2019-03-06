import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/refresh_load_listview.dart';
import 'package:fastodon/widget/article_cell.dart';
import 'package:fastodon/models/article_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {  
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
    ArticleItem lineItem = ArticleItem.fromJson(data[index]);
    return ArticleCell(item: lineItem);
  }

  void showNewArtical() {
    eventBus.emit(EventBusKey.ShowNewArticalWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: MyColor.mainColor,
      ),
      body: LoadingWidget(
        endLoading: _canLoadWidget,
        childWidget: RefreshLoadListView(
          requestUrl: Api.HomeTimeLine,
          buildRow: row,
        )
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          child: Icon(Icons.mode_edit),
          foregroundColor: Colors.white,
          backgroundColor: MyColor.mainColor,
          heroTag: null,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            showNewArtical();
          },
          mini: false,
          shape: new CircleBorder(),
          isExtended: false,
        );
      }),
    );
  }
}