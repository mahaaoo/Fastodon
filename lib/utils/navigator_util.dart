import 'package:flutter/material.dart';
import 'navigator_manager.dart';

class NavigatorUtil {
  static pushReplacementNamed(String routeName, [WidgetBuilder builder]) {
    NavigatorManager.getInstance().pushReplacementNamed(routeName, builder);
  }
  
  static pushNamed(String routeName, [WidgetBuilder builder]) {
    NavigatorManager.getInstance().pushNamed(routeName, builder);
  }
  
  static pop<T extends Object>([T result]) {
    NavigatorManager.getInstance().pop();
  }
  
  static pushNamedAndRemoveUntil(String newRouteName) {
    NavigatorManager.getInstance().pushNamedAndRemoveUntil(newRouteName);
  }
}