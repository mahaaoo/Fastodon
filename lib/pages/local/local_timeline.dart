import 'package:flutter/material.dart';

class LocalTimeline extends StatefulWidget {
  @override
  _LocalTimelineState createState() => _LocalTimelineState();
}

class _LocalTimelineState extends State<LocalTimeline> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('2');
  }

}