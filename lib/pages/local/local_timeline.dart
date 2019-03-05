import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/refresh_load_listview.dart';
import 'package:fastodon/widget/article_cell.dart';
import 'package:fastodon/models/article_item.dart';

class LocalTimeline extends StatefulWidget {
  @override
  _LocalTimelineState createState() => _LocalTimelineState();
}

class _LocalTimelineState extends State<LocalTimeline> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Widget row(int index, List data) {
    ArticleItem lineItem = ArticleItem.fromJson(data[index]);
    return ArticleCell(item: lineItem);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshLoadListView(
      requestUrl: Api.LocalTimeLine,
      buildRow: row,
    );
  }
}