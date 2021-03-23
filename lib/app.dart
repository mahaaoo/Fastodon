import 'package:flutter/material.dart';

import 'package:fastodon/utils/context_util.dart';
import 'package:fastodon/pages/index.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fastodon',
      navigatorKey: ContextUtil.myContext,
      home: RootPage(),
    );
  }
}

