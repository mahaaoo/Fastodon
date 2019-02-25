import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/untils/request.dart';
import 'package:fastodon/untils/my_color.dart';

import 'package:fastodon/models/server_item.dart';

class ServerList extends StatefulWidget {
  @override
  _ServerListState createState() => _ServerListState();
}

class _ServerListState extends State<ServerList>  {
  final String noticeString = '您只需选择一个节点即可进行注册。无论选择哪个节点，您都可以与任何人进行交流！';
  List _serverList = [];

  @override
  void initState() {
    super.initState();
    _getServerList();
  }

  Future<void> _getServerList() async {
    Map<String, dynamic> header = Map();
    header['Authorization'] = 'Bearer pEpudHDXGCMgCKtDky37mdO6mwtynpbIU07pi3SsMhGLA4pDlB7nnS5Yzbs5JzbT59pkIajfXINxKDZvloVTnNfzlx9GOrODP0ytRhIey1xxizEK0dqZgX9GGz427K4e';
    
    Request.get(url: 'https://instances.social/api/1.0/instances/list', header: header, callBack: (data) {
      List allServer = data['instances'];
      print(allServer.length);
      setState(() {
        _serverList = allServer;
      });
    });
  }

  Widget _rowBuild(BuildContext context, int index, ServerItem item) {
    return Container(
      color: MyColor.white,
      child: Row(
        children: <Widget>[
          Text(item.name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.white,
      appBar: AppBar(
        backgroundColor: MyColor.primary,
        title: Text('选择节点', style: TextStyle(color: MyColor.white),),
        toolbarOpacity: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () => _getServerList(),
        child: Column(
          children: <Widget>[
            Container(
              color: MyColor.backgroundColor,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(noticeString, style: TextStyle(fontSize: 12),), 
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  ServerItem item = ServerItem.fromJson(_serverList[index]);
                  return _rowBuild(context, index, item);
                },
                itemCount: _serverList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

