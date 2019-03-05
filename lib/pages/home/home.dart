import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/article_list.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: MyColor.mainColor,
      ),
      body: LoadingWidget(
        endLoading: _canLoadWidget,
        childWidget: ArticleList(
          timelineHost: Api.HomeTimeLine,
        ),
      ),
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return new FloatingActionButton(
          child: const Icon(Icons.add),
          foregroundColor: Colors.white,
          backgroundColor: MyColor.mainColor,
          heroTag: null,
          elevation: 7.0,
          highlightElevation: 14.0,
          onPressed: () {
            print('发送新文章');
          },
          mini: false,
          shape: new CircleBorder(),
          isExtended: false,
        );
      }),
    );
  }
}