import 'package:flutter/material.dart';

import 'package:fastodon/pages/home/index.dart';
import 'package:fastodon/utils/context_util.dart';

// import 'package:provider/provider.dart';
// import 'package:fastodon/stores/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feibo',
      navigatorKey: ContextUtil.myContext,
      home: MyHomePage(),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [ChangeNotifierProvider.value()],
//       child: Consumer<AppInfoProvider>(
//         builder: (context, appInfo, _) {
//           return MaterialApp(
//             title: 'Feibo',
//             navigatorKey: ContextUtil.myContext,
//             home: MyHomePage(),
//           );
//         },
//       )
//     );
//   }
// }

