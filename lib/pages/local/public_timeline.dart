import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/article_list.dart';

class PublicTimeline extends StatefulWidget {
  @override
  _PublicTimelineState createState() => _PublicTimelineState();
}

class _PublicTimelineState extends State<PublicTimeline> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return ArticleList(
      timelineHost: Api.PublicTimeLine,
    );
  }

}