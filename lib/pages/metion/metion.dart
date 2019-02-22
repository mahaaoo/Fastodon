import 'package:flutter/material.dart';

class Metion extends StatefulWidget {
  @override
  _MetionState createState() => _MetionState();
}

class _MetionState extends State<Metion> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Text('metion');
  }
}