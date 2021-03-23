import 'package:flutter/material.dart';

import 'package:fastodon/config/color/default_color.dart';
import 'package:fastodon/config/color/index.dart';

class AppInfo with ChangeNotifier {
  // app主题颜色
  ColorsModel _themeColor = new DefaultColor();
}
