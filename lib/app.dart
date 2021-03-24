import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:fastodon/utils/context_util.dart';
import 'package:fastodon/pages/index.dart';
import 'package:fastodon/stores/app_info.dart';
import 'package:fastodon/utils/navigator_manager.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: AppInfo())],
      child: Consumer<AppInfo>(
        builder: (context, appInfo, _) {
          return MaterialApp(
            title: 'Fastodon',
            navigatorObservers: [NavigatorManager.getInstance()],
            navigatorKey: ContextUtil.myContext,
            routes: NavigatorManager.configRoutes,
            home: RootPage(),
          );
        },
      ),
    );
  }
}

