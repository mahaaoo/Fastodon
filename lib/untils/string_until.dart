import 'package:fastodon/models/owner_account.dart';

class StringUntil {
  static String displayName(OwnerAccount item) {
    String displayName = '';
    if (item.displayName == '' || item.displayName.length == 0) {
      displayName = item.acct;
    } else {
      displayName = item.displayName;
    }
    return displayName;
  }
}
