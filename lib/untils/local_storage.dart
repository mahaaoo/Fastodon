import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static void save(String key, String value) async {
    try {
      print(key + value);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
      print('存储成功');
    } catch (e) {
      print('存储失败');
    }
  }

  static Future<String> getString(String key) async {
    print('开始访问本地资源' +  key);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String response = prefs.getString(key);
      Set keys =prefs.getKeys();
      print('获取的内容是' + response);
      print(keys);
      return response;
    } catch (e) {
      print('报错了');
      print(e.toString());
    }
  }
}