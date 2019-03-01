import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static void save(String key, String value) async {
    try {
      print(key + value);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
    } catch (e) {
      print('存储失败');
    }
  }

  static Future<String> getString(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String response = prefs.getString(key);
      return response;
    } catch (e) {
      print('报错了');
      print(e.toString());
      return null;
    }
  }

  static void removeString(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
    } catch (e) {
      print('报错了');
      print(e.toString());
      return null;
    }
  }
}