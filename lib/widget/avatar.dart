import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:fastodon/public.dart';

class Avatar extends StatelessWidget {
  Avatar({
    Key key, 
    @required this.url,
    this.width = 50,
    this.height = 50,
   }) : super(key: key);

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) { 
    if (url == null) {
      return Container(
        width: width,
        height: height,
        color: MyColor.unLoadWidgetInstead,
      );
    }
    return ClipRRect(
      child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );
  }
}
