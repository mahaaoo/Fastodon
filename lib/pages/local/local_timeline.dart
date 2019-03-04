import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/article_list.dart';

class LocalTimeline extends StatefulWidget {
  @override
  _LocalTimelineState createState() => _LocalTimelineState();
}

class _LocalTimelineState extends State<LocalTimeline> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ArticleList(
      timelineHost: Api.LocalTimeLine,
    );
  }
}