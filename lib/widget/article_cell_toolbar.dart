import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/models/article_item.dart';

class ArticleCellToolbar extends StatefulWidget {
  ArticleCellToolbar({
    Key key, 
    this.item,
  }) : super(key: key);
  final ArticleItem item;

  @override
  _ArticleCellToolbarState createState() => _ArticleCellToolbarState();
}

class _ArticleCellToolbarState extends State<ArticleCellToolbar> {
  bool _favourite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _favourite = widget.item.favourited;
    });
  }

  Future<void> _onPressFavoutite(String url) async {
    setState(() {
      _favourite = !_favourite;
    });
    Request.post(url: url).then((data) {
      ArticleItem newItem = ArticleItem.fromJson(data);
      setState(() {
        _favourite = newItem.favourited;
      });
    }).catchError((onError) {
      setState(() {
        _favourite = !_favourite;
      });
    });
  }

  Widget favouritedAtion() {
    if(_favourite == true){
      return Icon(Icons.favorite, color: Colors.red);
    } else {
      return Icon(Icons.favorite_border, color: MyColor.timelineUnIconColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: () {

          },
          child: Row(
            children: <Widget>[
              Icon(Icons.reply, color: MyColor.timelineUnIconColor),
              SizedBox(width: 3),
              Text('${widget.item.favouritesCount}', style: TextStyle(color: MyColor.timelineUnIconColor, fontSize: 12),),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {

          },
          child: Icon(Icons.repeat, color: MyColor.timelineUnIconColor),
        ),
        GestureDetector(
          onTap: () {
            if (_favourite == false) {
              _onPressFavoutite(Api.FavouritesArticle(widget.item.id));
            } else {
              _onPressFavoutite(Api.UnFavouritesArticle(widget.item.id));
            }
          },
          child: favouritedAtion(),
        ),
      ],
    );

  }
}