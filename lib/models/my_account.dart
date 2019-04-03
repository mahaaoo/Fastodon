import 'package:fastodon/models/owner_account.dart';

class MyAccount {
  OwnerAccount account;
  // 工厂模式
  factory MyAccount() =>_getInstance();
  static MyAccount get instance => _getInstance();
  static MyAccount _instance;
  MyAccount._internal() {
    // 
  }
  static MyAccount _getInstance() {
    if (_instance == null) {
      _instance = new MyAccount._internal();
    }
    return _instance;
  }

  setAcc(OwnerAccount account) {
    this.account = account;
  }

  OwnerAccount getAcc() {
    return this.account;
  }
}
