import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static void save({String key, String value}) async {
    try {
      print(key + value);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(key, value);
    } catch (e) {
    }
  }

  static Future<String> getString({String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String response = prefs.getString(key);
      return response;
    } catch (e) {
      return null;
    }
  }

  static void removeString({String key}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(key);
    } catch (e) {
      return null;
    }
  }
}