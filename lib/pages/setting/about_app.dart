import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpandStateBean{
  var isOpen;
  var index;
  ExpandStateBean(this.index,this.isOpen);
}

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  
  List<String> pluginName = [
    'dio',
    'json_serializable',
    'cached_network_image',
    'shared_preferences',
    'flutter_spinkit',
    'fluttertoast',
    'flutter_webview_plugin',
    'flutter_html',
    'url_launcher',
  ];

  List<String> pluginInfo = [
    'A powerful Http client for Dart, which supports Interceptors, FormData, Request Cancellation, File Downloading, Timeout etc.',
    'Generates utilities to aid in serializing to/from JSON.',
    'Download, cache and show images in a flutter app.',
    'Wraps NSUserDefaults (on iOS) and SharedPreferences (on Android), providing a persistent store for simple data. Data is persisted to disk asynchronously. Neither platform can guarantee that writes will be persisted to disk after returning and this plugin must not be used for storing critical data.',
    'A collection of loading indicators animated with flutter.',
    'Android Toast Plugin for Flutter.',
    'WebView Plugin - Allows Flutter to communicate with a native WebView.',
    'A Flutter widget for rendering static html as Flutter widgets.',
    'A Flutter plugin for launching a URL in the mobile platform. Supports iOS and Android.'
  ];

  List<String> pluginLink = [
    'https://github.com/flutterchina/dio',
    'https://github.com/dart-lang/json_serializable',
    'https://github.com/renefloor/flutter_cached_network_image',
    'https://pub.dartlang.org/packages/shared_preferences',
    'https://github.com/jogboms/flutter_spinkit',
    'https://github.com/PonnamKarthik/FlutterToast',
    'https://github.com/fluttercommunity/flutter_webview_plugin',
    'https://github.com/Sub6Resources/flutter_html',
    'https://pub.dartlang.org/packages/url_launcher',
  ];

  @override
  void initState() {
    super.initState();
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < pluginName.length; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index,isExpand) {
    setState(() {
      expandStateList.forEach((item){
        if (item.index==index) {
          item.isOpen=!isExpand;
        }
      });
    });
  }

  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开源组件"),
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Text('当前App版本：1.0', style: TextStyle(color: Colors.white)),
          ),
          preferredSize: Size(30, 20)
        ),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(pluginName[index]),
                );
              },
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: '简介：',
                          style: TextStyle(
                            color: Colors.black
                          ),
                          children: [
                            TextSpan(
                              text: pluginInfo[index],
                              style: TextStyle(
                                color: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _launchURL(pluginLink[index]);
                        },
                        child: Text(
                          pluginLink[index],
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
          expansionCallback: (index, bol) {
            _setCurrentIndex(index,bol);
          },
        ),
      )
    );
  }
}