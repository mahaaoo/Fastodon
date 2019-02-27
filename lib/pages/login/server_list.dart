import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:fastodon/untils/request.dart';
import 'package:fastodon/untils/my_color.dart';
import 'package:fastodon/untils/app_navigate.dart';

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
      if(this.mounted) {
        setState(() {
          _serverList = allServer;
        });
      }
    });
  }

  Widget _serverLogo(String url) {
    if(url == null) {
      return Image.asset('image/wallpaper.png', width: 70, height: 70);
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        width: 70,
        height: 70,
      );
    }
  }

  Widget _rowBuild(BuildContext context, int index, ServerItem item) {
    String shortDes = '';
    if (item.info != null && item.info.shortDescription != null) {
      shortDes = item.info.shortDescription;
    }
    double users = int.parse(item.users) / 1000;
    List userNum = users.toString().split(".");
    String showUsers = '';
    if (userNum[0] == '0') {
      showUsers = userNum[0] + 'K用户';
    } else {
      showUsers = userNum[1] + '用户';
    }

    return GestureDetector(
      onTap: () {
        AppNavigate.pop(context, param: item);
      },
      child: Container(
        color: MyColor.white,
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: _serverLogo(item.thumbnail),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.name, style: TextStyle(fontSize: 15),),
                  SizedBox(height: 5),
                  Text(shortDes, maxLines: 3, style: TextStyle(fontSize: 13)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: MyColor.aLiveColor
                        ),
                      ),
                      SizedBox(width: 5),
                      Text('稳定', style: TextStyle(color: MyColor.aLiveColor)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          color: MyColor.aLiveColor
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(showUsers, style: TextStyle(color: MyColor.aLiveColor))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loadingRequest(BuildContext context) {
    if(_serverList.length == 0) {
      return SpinKitThreeBounce(
        color: MyColor.primary,
        size: 50.0,
      );
    }
    return RefreshIndicator(
        onRefresh: () => _getServerList(),
        child: Column(
          children: <Widget>[
            Container(
              color: MyColor.backgroundColor,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(noticeString, style: TextStyle(fontSize: 12),), 
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  ServerItem item = ServerItem.fromJson(_serverList[index]);
                  return _rowBuild(context, index, item);
                },
                itemCount: _serverList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Divider(height: 1.0, color: MyColor.backgroundColor),
                  );
                },
              ),
            ),
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
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: _loadingRequest(context),
    );
  }
}

