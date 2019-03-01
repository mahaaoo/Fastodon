import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fastodon/public.dart';
import 'model/home_line.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  List _homeTimeLineList = [];
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    // 隐藏登录弹出页
    eventBus.on(EventBusKey.StorageSuccess, (arg) {
      _homeTimeLine();
    });
  }

  Future<void> _homeTimeLine() async {
    Request.get(url: Api.HomeTimeLine, callBack: (data) {
       setState(() {
         _homeTimeLineList = data;
       });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.StorageSuccess);
    super.dispose();
  }
  Widget _rowBuild(BuildContext context, HomeLine lineItem) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: ClipRRect(
                child: new CachedNetworkImage(
                    imageUrl: lineItem.account.avatarStatic,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            Expanded(
              child: Container(
              height: 50,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Baseline(
                              baseline: 20,
                              baselineType: TextBaseline.alphabetic,
                              child: Text(lineItem.account.displayName, style: TextStyle(fontSize: 16)),
                            ),
                            SizedBox(width: 5),
                            Baseline(
                              baseline: 20,
                              baselineType: TextBaseline.alphabetic,
                              child: Text('@' + lineItem.account.username,  style: TextStyle(fontSize: 13, color: MyColor.greyText)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.more_horiz, color: MyColor.homeIconColor),
                        )
                      ],
                    ),
                    Text('1分钟前',style: TextStyle(fontSize: 13, color: MyColor.greyText)),                
                  ],
                ),
            ),
            )
            
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Html(
            data: lineItem.content,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.reply, color: MyColor.homeIconColor),
            Icon(Icons.repeat, color: MyColor.homeIconColor ),
            Icon(Icons.star, color: MyColor.homeIconColor),
            
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _homeTimeLine(),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            HomeLine lineItem =HomeLine.fromJson(_homeTimeLineList[index]);
            return _rowBuild(context, lineItem);
          },
          itemCount: _homeTimeLineList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1.0, color: MyColor.dividerLineColor);
          },
        )
      ),
    );
  }
}