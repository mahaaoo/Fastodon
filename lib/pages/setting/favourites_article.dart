import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/widget/refresh_load_listview.dart';
import 'package:fastodon/widget/article_cell.dart';
import 'package:fastodon/models/article_item.dart';

class FavoutitesArticle extends StatefulWidget {
  @override
  _FavoutitesArticleState createState() => _FavoutitesArticleState();
}

class _FavoutitesArticleState extends State<FavoutitesArticle> {  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget row(int index, List data) {
    ArticleItem lineItem = ArticleItem.fromJson(data[index]);
    return ArticleCell(item: lineItem);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
        centerTitle: true,
        backgroundColor: MyColor.mainColor,
      ),
      body: RefreshLoadListView(
        requestUrl: Api.Favourites,
        buildRow: row,
      )
    );
  }
}