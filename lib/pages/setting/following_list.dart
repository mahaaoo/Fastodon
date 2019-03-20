// 下拉刷新和上拉加载
import 'package:flutter/material.dart';
import 'package:fastodon/public.dart';
import 'package:fastodon/pages/setting/model/owner_account.dart';
import 'follow_cell.dart';

class FollowingList extends StatefulWidget {
  @override
  _FollowingListState createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  List _dataList = [];
  bool _finishRequest = false;

  @override 
  void initState() {
    super.initState();
    _startRequest();
  }

  Future<void> _startRequest() async {
    Request.get(url: Api.Following('54180'), callBack: (List data) {
      if(this.mounted) {
        setState(() {
          _dataList = data;
          _finishRequest = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      endLoading: _finishRequest,
      childWidget: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          OwnerAccount account = OwnerAccount.fromJson(_dataList[index]);
          return FollowCell(item: account);
        },
        itemCount: _dataList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 1.0, color: MyColor.dividerLineColor);
        },
      ),
    );
  }
}