import 'package:flutter/material.dart';
import 'local_timeline.dart';
import 'public_timeline.dart';

class Local extends StatefulWidget {
  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('热门'),
          bottom: PreferredSize(
            preferredSize: Size(0, MediaQuery.of(context).padding.top + 16),
            child: Container(
              color: Colors.white,
              height: 35,
              child: TabBar(
                labelStyle: TextStyle(fontSize: 16),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: '本地'),
                  Tab(text: '跨站'),
                ],
              ),
            ),
          ),
          elevation: 0,
        ),
        body: TabBarView(children: [
          LocalTimeline(),
          PublicTimeline(),
        ]),
      ),
    );
  }
}