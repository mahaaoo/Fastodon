import 'package:fastodon/config/storage_key.dart';
import 'package:fastodon/stores/user.dart';
import 'package:fastodon/utils/index.dart';
import 'package:flutter/material.dart';

import 'package:fastodon/pages/login/guide.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

      print(host);
      print(token);

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
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'home',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
