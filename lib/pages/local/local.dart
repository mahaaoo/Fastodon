import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';

import 'local_timeline.dart';
import 'public_timeline.dart';

class Local extends StatefulWidget {
  @override
  _LocalState createState() => _LocalState();
}

class _LocalState extends State<Local> with AutomaticKeepAliveClientMixin {
  bool _local = true;
  bool _showTab = false;

  @override
  void initState() {
    super.initState();
    eventBus.on(EventBusKey.LoadLoginMegSuccess, (arg) {
      setState(() {
        _showTab = true;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventBusKey.LoadLoginMegSuccess);
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor,
        title: _local == true ? Text('本地') : Text('跨站'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                _local = !_local;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: _local == true ? Icon(Icons.public, size: 30) : Icon(Icons.people, size: 30)
            ),
          )
        ],
      ),
      body: LoadingWidget(
        childWidget: _local == true ? LocalTimeline() : PublicTimeline(),
        endLoading: _showTab
      ),
    );
  }
}