import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  static cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value is int) {
        await sharedPreferences.setInt(key, value);
        return true;
      } else if (value is double) {
        await sharedPreferences.setDouble(key, value);
        return true;
      } else if (value is bool) {
        await sharedPreferences.setBool(key, value);
        return true;
      } else {
        await sharedPreferences.setStringList(key, value);

        return true;
      }
    } catch (e) {
      return false;
    }
  }

  static deleteItem({required int index}) {
    sharedPreferences.remove("title"[index]);
    sharedPreferences.remove("body"[index]);
    sharedPreferences.remove("completed"[index]);
  }

  static getData({required String key}) {
    return sharedPreferences.get(key);
  }
}
