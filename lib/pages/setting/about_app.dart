import 'package:flutter/material.dart';

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
  
  @override
  void initState() {
    super.initState();
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("开源组件"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('我是第$index个标题'),
                );
              },
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(height: 100.0,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child:Icon(Icons.security,size: 35.0,),),
              ),
              isExpanded: expandStateList[index].isOpen,
            );
          }).toList(),
          expansionCallback: (index, bol) {
            print('saddsa');
            _setCurrentIndex(index,bol);
          },
        ),
      )
    );
  }
}