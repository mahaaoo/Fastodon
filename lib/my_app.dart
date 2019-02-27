import 'package:flutter/material.dart';
import 'pages/root_page.dart';
import 'pages/login/login.dart';

import 'package:fastodon/untils/local_storage.dart';
import 'package:fastodon/constant/storage_key.dart';
import 'package:fastodon/untils/app_navigate.dart';

class MyApp extends StatelessWidget {
  void _showLoginWidget(BuildContext context) {
    Future<String> hostString = Storage.getString(StorageKey.HostUrl);
    Future<String> tokenString = Storage.getString(StorageKey.Token);
// 保证本地存有host地址以及token
    hostString.then((String host) {
      return tokenString.then((String token) {
        if (host == '' || host == null || token == '' || token == null) {
          showBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Login();
            }
          );
        }
      });
    });
  }

  void _hideLoginWidget(BuildContext context) {
    AppNavigate.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fastondon',
      home: Scaffold(
        body: Builder(
          builder: (context) => RootPage(
            showWidget: () {_showLoginWidget(context);},
            hideWidget: () {_hideLoginWidget(context);}
          )
        )
      ),
    );
  }
}
