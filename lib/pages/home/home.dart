import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fastodon/public.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  List _homeTimeLineList = [];
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 隐藏登录弹出页
    eventBus.on(EventBusKey.StorageSuccess, (arg) {
    });
  }

  Future<void> _homeTimeLine() async {
    Request.get();
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.StorageSuccess);
    super.dispose();
  }
// https://cmx.im/system/accounts/avatars/000/000/001/original/582dc1b4215085e0.png?1506860187
  Widget _rowBuild(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              child: new CachedNetworkImage(
                  imageUrl: "https://cmx.im/system/accounts/avatars/000/000/001/original/582dc1b4215085e0.png?1506860187",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            Column(
              children: <Widget>[
                Text('海嘟嘟'),
                Text('1分钟前')
              ],
            )
          ],
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _homeTimeLine(),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _rowBuild(context);
          },
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(height: 1.0, color: MyColor.backgroundColor),
            );
          },
        )
      ),
    );
  }
}