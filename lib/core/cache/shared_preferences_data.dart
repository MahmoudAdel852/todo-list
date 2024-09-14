import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
static  late SharedPreferences sharedPreferences;

 static cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setData({required String key, dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;

    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;

    }
     if (value is List<String>) {
      await sharedPreferences.setStringList(key, value);
      return true;
    }
     return false;
  }


 static getData ({required String key}){
    return sharedPreferences.get(key);
  }



}
