import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'home/index.dart';
import 'found/index.dart';
import 'notify/index.dart';
import 'mine/index.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Icon> _tabImages = [
    Icon(Icons.home),
    Icon(Icons.people),
    Icon(Icons.notifications),
    Icon(Icons.settings),
  ];

  List<Icon> _tabSelectedImages = [
    Icon(Icons.home),
    Icon(Icons.people),
    Icon(Icons.notifications),
    Icon(Icons.settings),
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
          HomePage(),
          FoundPage(),
          NotifyPage(),
          MinePage()
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
