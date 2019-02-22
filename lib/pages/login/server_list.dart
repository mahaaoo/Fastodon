import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:fastodon/untils/request.dart';

class ServerList extends StatefulWidget {
  @override
  _ServerListState createState() => _ServerListState();
}

class _ServerListState extends State<ServerList>  {

  @override
  void initState() {
    super.initState();
    _getServerList();

  }

  Future<void> _getServerList() async {
    Request.get('https://instances.social/api/1.0/instances/list', (data){
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 64,
              child: Center(
                child: Text('选择节点', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            RefreshIndicator(
              onRefresh: () => _getServerList(),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ;
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}