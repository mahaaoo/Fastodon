import 'package:fastodon/pages/setting/model/owner_account.dart';
class Account {
  OwnerAccount account;
  // 工厂模式
  factory Account() =>_getInstance();
  static Account get instance => _getInstance();
  static Account _instance;
  Account._internal() {
    // 
  }
  static Account _getInstance() {
    if (_instance == null) {
      _instance = new Account._internal();
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
