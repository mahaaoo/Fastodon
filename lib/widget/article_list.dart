import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/models/article_item.dart';
import 'article_cell.dart';

class ArticleList extends StatefulWidget {
  ArticleList({
    Key key, 
    @required this.timelineHost
  }) : super(key: key);
  final String timelineHost;

  @override
  _ArticleListState createState() => _ArticleListState();
}

enum ListStatus {
  normal,
  loadingData,
  noMoreData
}

class _ArticleListState extends State<ArticleList> {
  ScrollController _scrollController = ScrollController();
  List _timeLineList = [];
  bool _finishRequest = false;
  ListStatus _listStatus = ListStatus.normal;

  @override 
  void initState() {
    super.initState();
    _homeTimeLine(widget.timelineHost);

    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _listStatus != ListStatus.noMoreData) {
        setState(() {
          _listStatus = ListStatus.loadingData;
        });
        String lastCellId = ArticleItem.fromJson(_timeLineList[_timeLineList.length - 1]).id;
        if (widget.timelineHost.contains('?')) {
          _homeTimeLine(widget.timelineHost + '&max_id=$lastCellId');
        } else {
          _homeTimeLine(widget.timelineHost + '?max_id=$lastCellId');
        }
      }
    });
  }

  Future<void> _homeTimeLine(String url, {bool refresh}) async {
    Request.get(url: url, callBack: (List data) {
      List combineList = [];
      if (refresh == true) {
        combineList = data;
      } else {
        combineList = _timeLineList;
        combineList.addAll(data);
      }
      setState(() {
        _timeLineList = combineList;
        _finishRequest = true;
        if (data.length == 0) {
          _listStatus = ListStatus.noMoreData;
        } else {
          _listStatus = ListStatus.normal;
        }
      });
    });
  }

  Widget buildFooter() {
    if (_listStatus == ListStatus.normal) {
      return Container();
    } else if (_listStatus == ListStatus.loadingData) {
      return Container(
        height: 40,
        child: Center(
          child: SpinKitThreeBounce(
            color: MyColor.mainColor,
            size: 23,
          ),
        ),
      );
    } else if (_listStatus == ListStatus.noMoreData) {
      return Container(
        height: 40,
        child: Center(
          child: Text('没有更多数据了'),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildRow(int index) {
    ArticleItem lineItem = ArticleItem.fromJson(_timeLineList[index]);
    if (index == _timeLineList.length - 1) {
      return Column(
        children: <Widget>[
          ArticleCell(item: lineItem),
          buildFooter(),
        ],
      );
    } else {
      return ArticleCell(item: lineItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _homeTimeLine(widget.timelineHost, refresh: true),
      child: LoadingWidget(
        endLoading: _finishRequest,
        childWidget: ListView.separated(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return buildRow(index);
          },
          itemCount: _timeLineList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 1.0, color: MyColor.dividerLineColor);
          },
        ),
      )
    );
  }
}