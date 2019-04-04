import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/models/media_attachment.dart';
import 'package:fastodon/public.dart';

class ArticleMedia extends StatelessWidget {
  ArticleMedia({
    Key key, 
    this.itemList,
   }) : super(key: key);

  final List itemList;

  List<Widget> picAndVideo () {
    List<Widget> picList = [];
    for (var data in itemList) {
      MediaAttachment media = MediaAttachment.fromJson(data);
      if(media.type == 'image') {
        picList.add(GestureDetector(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: CachedNetworkImage(
                imageUrl: media.previewUrl,
              ),
            ),
          ),
          onTap: () {
          },
        ));
      } else {
        picList.add(Container());
      }
    }
    return picList;
  }

  @override
  Widget build(BuildContext context) { 
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: picAndVideo(),
      ),
    );
  }
}
