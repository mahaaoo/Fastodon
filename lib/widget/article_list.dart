import 'package:flutter/material.dart';

import 'package:fastodon/public.dart';
import 'package:fastodon/widget/loading_widget.dart';
import 'package:fastodon/models/article_item.dart';
import 'article_cell.dart';

class ArticleList extends StatefulWidget {
  ArticleList({Key key, this.timelineHost}) : super(key: key);
  final String timelineHost;

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List _timeLineList = [];
  bool _finishRequest = false;

  @override 
  void initState() {
    super.initState();
    _homeTimeLine();
  }

  Future<void> _homeTimeLine() async {
    Request.get(url: widget.timelineHost, callBack: (data) {
       setState(() {
         _timeLineList = data;
         _finishRequest = true;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _homeTimeLine(),
      child: LoadingWidget(
        endLoading: _finishRequest,
        childWidget: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            ArticleItem lineItem = ArticleItem.fromJson(_timeLineList[index]);
            return ArticleCell(
              item: lineItem,
            );
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