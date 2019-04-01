import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';

class UserSheetCell extends StatelessWidget {
  UserSheetCell({
    Key key, 
    this.title,
    this.onPress,
   }) : super(key: key);

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      onTap: () {
        onPress();
        AppNavigate.pop(context);
      },
      child: Ink(
        color: MyColor.widgetDefaultColor,
        width: Screen.width(context),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Center(
          child: Text(title, style: TextStyle(fontSize: 15)),
        )
      ),
    );
  }
}
