import 'package:flutter/material.dart';
import 'navigator_manager.dart';

class NavigatorUtil {
  static pushReplacementNamed(String routeName, [WidgetBuilder builder]) {
    NavigatorManager.getInstance().pushReplacementNamed(routeName, builder);
  }
  
  static pushNamed(String routeName, { WidgetBuilder builder, Function callBack }) {
    NavigatorManager.getInstance().pushNamed(routeName, builder: builder, callBack: callBack );
  }
  
  static pop<T extends Object>([T result]) {
    NavigatorManager.getInstance().pop(result);
  }
  
  static pushNamedAndRemoveUntil(String newRouteName) {
    NavigatorManager.getInstance().pushNamedAndRemoveUntil(newRouteName);
  }
}