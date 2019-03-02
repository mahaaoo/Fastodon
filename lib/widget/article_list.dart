import 'package:flutter/material.dart';

import 'package:fastodon/public.dart';
import 'package:fastodon/models/article_item.dart';
import 'article_cell.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List _timeLineList = [];

  Future<void> _homeTimeLine() async {
    Request.get(url: Api.HomeTimeLine, callBack: (data) {
       setState(() {
         _timeLineList = data;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _homeTimeLine(),
      child: ListView.separated(
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
      )
    );
  }
}