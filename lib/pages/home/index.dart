import 'package:fastodon/config/storage_key.dart';
import 'package:fastodon/model/time_line_item.dart';
import 'package:fastodon/stores/user.dart';
import 'package:fastodon/utils/index.dart';
import 'package:flutter/material.dart';

import 'package:fastodon/pages/login/guide.dart';
import 'package:fastodon/components/refresh_listview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home_mobx.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeMobx store = new HomeMobx();

  @override
  void initState() {
    super.initState();

    Future<String> hostString = Storage.getString(key: StorageKey.HOST_URL);
    Future<String> tokenString = Storage.getString(key: StorageKey.TOKEN);

    Future.wait([hostString, tokenString]).then((List results) {
      var host = results[0];
      var token = results[1];

      User user = new User();
      user.setHost(host);
      user.setToken(token);

      if (host == '' || host == null || token == '' || token == null) {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) {
              return GuidePage();
            },
            fullscreenDialog: true,
          )
        );
      } else {
        store.getHomeLine();
      }
    });
  }

  Widget buildRow(int index, List<dynamic> data) {
    TimeLineItem item = TimeLineItem.fromJson(data[index]);
    return Container(
      child: Text(item.content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Observer(
        builder: (_) => RefreshListView(
          dataSource: store.dataSource,
          buildRow: buildRow,
        )
      ),
    );
  }
}
