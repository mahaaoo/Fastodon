import 'package:flutter/material.dart';
import 'pages/root_page.dart';
import 'pages/login/login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fastondon',
      home: Login(),
    );
  }
}
