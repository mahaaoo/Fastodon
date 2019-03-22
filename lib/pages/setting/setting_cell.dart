import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';

class SettingCell extends StatelessWidget {
  SettingCell({
    Key key, 
    this.title, 
    this.leftIcon,
    this.onPress
  }) : super(key: key);
  final String title;
  final Icon leftIcon;
  final Function onPress;

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      onTap: () => onPress,
      child: Column(
        children: <Widget>[
          Ink(
            color: MyColor.widgetDefaultColor,
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    leftIcon,
                    SizedBox(width: 10),
                    Text(title, style: TextStyle(fontSize: 15)),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50),
            child: Divider(height: 1.0, color: MyColor.dividerLineColor),
          )
        ],
      ),
    );
  }
}
