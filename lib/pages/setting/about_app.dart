// 下拉刷新和上拉加载
import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App开源组件'),
        centerTitle: true,
        backgroundColor: MyColor.mainColor,
      ),
    );
  }
}