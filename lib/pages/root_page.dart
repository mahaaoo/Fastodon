import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fastodon/public.dart';

import 'home/home.dart';
import 'local/local.dart';
import 'metion/metion.dart';
import 'setting/setting.dart';

class RootPage extends StatefulWidget {

  const RootPage({
    Key key,
    this.showLogin,
    this.hideWidget,
    this.showNewArtical
  }) : super(key: key);

  final Function showLogin;
  final Function hideWidget;
  final Function showNewArtical;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _tabIndex = 0;
  
  @override
  void initState() {
    super.initState();
    widget.showLogin();
    // 隐藏登录弹出页
    eventBus.on(EventBusKey.ShowLoginWidget, (arg) {
      widget.showLogin();
    });

    eventBus.on(EventBusKey.HidePresentWidegt, (arg) {
      widget.hideWidget();
    });
    // 弹出发送嘟文页面
    eventBus.on(EventBusKey.ShowNewArticalWidget, (arg) {
      widget.showNewArtical();
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.ShowLoginWidget);
    eventBus.off(EventBusKey.HidePresentWidegt);
    eventBus.off(EventBusKey.ShowNewArticalWidget);
    super.dispose();
  }

  List<Icon> _tabImages = [
    Icon(Icons.home),
    Icon(Icons.people),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];
  List<Icon> _tabSelectedImages = [
    Icon(Icons.home, color: MyColor.mainColor),
    Icon(Icons.people, color: MyColor.mainColor),
    Icon(Icons.notifications, color: MyColor.mainColor),
    Icon(Icons.settings, color: MyColor.mainColor),
  ];

  Icon getTabIcon(int index) {
    if(index == _tabIndex) {
      return _tabSelectedImages[index];
    }else {
      return _tabImages[index];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: IndexedStack(
        children: <Widget>[
          Home(),
          Local(),
          Metion(),
          Setting()
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0)),
          BottomNavigationBarItem(icon: getTabIcon(1)),
          BottomNavigationBarItem(icon: getTabIcon(2)),
          BottomNavigationBarItem(icon: getTabIcon(3)),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
