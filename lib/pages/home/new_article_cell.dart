import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';

class NewArticleCell extends StatelessWidget {
  NewArticleCell({
    Key key, 
    this.title,
    this.description,
    this.leftIcon,
    this.onSelect,
    this.currentIcon,
   }) : super(key: key);

  final String title;
  final String description;
  final Icon leftIcon;
  final Icon currentIcon;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(leftIcon);
        AppNavigate.pop(context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        color: MyColor.widgetDefaultColor,
        width: Screen.width(context),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: leftIcon,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 5),
                  Text(description),
                ],
              ),
            ),
            leftIcon.icon == currentIcon.icon ? Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.check),
            ): Container(),
          ],
        ),
      ),
    );
  }
}
