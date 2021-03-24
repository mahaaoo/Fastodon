import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fastodon/pages/login/login.dart';
import 'package:fastodon/pages/login/oauth_webview.dart';

class NavigatorManager extends NavigatorObserver {
    /* 单例给出NavigatorManager */
  static NavigatorManager navigatorManager;
  static NavigatorManager getInstance() {
    if (navigatorManager == null) {
      navigatorManager = new NavigatorManager();
      _streamController = StreamController.broadcast();
    }
    return navigatorManager;
  }

  /* 配置routes */
  static Map<String, WidgetBuilder> configRoutes = {
    'LoginPage': (_) =>  LoginPage(),
    'OauthWebView': (_) =>  OauthWebView(),
  };

  // 当前路由栈
  static List<Route> _mRoutes;
  List<Route> get routes => _mRoutes;
  // 当前路由
  Route get currentRoute => _mRoutes[_mRoutes.length - 1];
  // stream相关
  static StreamController _streamController;
  StreamController get streamController=> _streamController;
  // 用来路由跳转
  static NavigatorState navigatorUtil;
    
  // replace 页面
  pushReplacementNamed(String routeName, [WidgetBuilder builder]) {
    return navigatorUtil.pushReplacement(
      CupertinoPageRoute(
        builder: builder ?? configRoutes[routeName],
        settings: RouteSettings(name: routeName),
      ),
    );
  }
  
  // push 页面
  pushNamed(String routeName, [WidgetBuilder builder]) {
    return navigatorUtil.push(
      CupertinoPageRoute(
        builder: builder ?? configRoutes[routeName],
        settings: RouteSettings(name: routeName),
      ),
    );
  }
  
  // pop 页面
  pop<T extends Object>([T result]) {
    navigatorUtil.pop(result);
  }
  
  // push一个页面， 移除该页面下面所有页面
  pushNamedAndRemoveUntil(String newRouteName) {
    return navigatorUtil.pushNamedAndRemoveUntil(newRouteName, (Route<dynamic> route) => false);
  }
  
  // 当调用Navigator.push时回调
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    if (_mRoutes == null) {
      _mRoutes = new List<Route>();
    }
    // 这里过滤调push的是dialog的情况
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.add(route);
      routeObserver();
    }
  }
  
  // 当调用Navigator.replace时回调
  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    super.didReplace();
    if (newRoute is CupertinoPageRoute || newRoute is MaterialPageRoute) {
      _mRoutes.remove(oldRoute);
      _mRoutes.add(newRoute);
      routeObserver();
    }
  }
  
  // 当调用Navigator.pop时回调
  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    if (route is CupertinoPageRoute || route is MaterialPageRoute) {
      _mRoutes.remove(route);
      routeObserver();
    }
  }
  
  @override
  void didRemove(Route removedRoute, Route oldRoute) {
    super.didRemove(removedRoute, oldRoute);
    if (removedRoute is CupertinoPageRoute || removedRoute is MaterialPageRoute) {
      _mRoutes.remove(removedRoute);
      routeObserver();
    }
  }
  
  void routeObserver() {
    print('&&路由栈&&');
    // 当前页面的navigator，用来路由跳转
    navigatorUtil = _mRoutes[_mRoutes.length - 1].navigator;
    streamController.sink.add(_mRoutes);
  }
}
