import 'package:shared_preferences/shared_preferences.dart';

class LJJSaveData {
  static Future<void> setString(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String> getString(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var value = sp.getString(key);
    return value;
  }

  static Future<void> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }

   static Future<void> remove(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
