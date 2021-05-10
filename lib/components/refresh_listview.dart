// 下拉刷新和上拉加载
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RefreshListView extends StatefulWidget {
  RefreshListView({
    Key key, 
    @required this.buildRow,
    @required this.dataSource,
    this.onRefresh,
    this.onLoadMore,
  }) : super(key: key);
  final Function buildRow;
  final Function onRefresh;
  final Function onLoadMore;
  final List<dynamic> dataSource;

  @override
  _RefreshListViewState createState() => _RefreshListViewState();
}

enum ListStatus {
  // listview处于正常状态
  normal,
  // listview正在加载中
  loadingData,
  // listview已经没有更多的数据了
  noMoreData
}

class _RefreshListViewState extends State<RefreshListView> {
  ScrollController _scrollController = ScrollController();
  ListStatus _listStatus = ListStatus.normal;

  @override 
  void initState() {
    super.initState();

// 监听listview垂直滚动距离，根据滚动的位置判断是否接近listview底端，实现下拉加载
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _listStatus != ListStatus.noMoreData) {
        setState(() {
          _listStatus = ListStatus.loadingData;
        });
        // 下拉加载请求
        widget.onLoadMore();
      }
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
            color: Colors.red,
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
    if (index == widget.dataSource.length - 1) {
      return Column(
        children: <Widget>[
          widget.buildRow(index, widget.dataSource),
          buildFooter(),
        ],
      );
    }
    return widget.buildRow(index, widget.dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => widget.onRefresh(),
      child: ListView.separated(
        padding: EdgeInsets.only(top: 0),
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return buildRow(index);
        },
        itemCount: widget.dataSource.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0, color: Colors.red);
        },
      ),
    );
  }
}