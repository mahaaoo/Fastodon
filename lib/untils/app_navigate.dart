import 'package:flutter/material.dart';

class AppNavigate {
  static push(BuildContext context, Widget scene, {Function callBack}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => scene,
      ),
    ).then((data) {
      callBack(data);
    });
  }
  static pop(BuildContext context, {dynamic param}) {
    Navigator.of(context).pop(param);
  }
}
