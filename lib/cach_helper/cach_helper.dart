import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setBoolean({
    required String key,
    required bool value,
  }) async{
  return await  sharedPreferences!.setBool(key, value);
  }

  static bool? getBoolean({required String key})
  {
   return sharedPreferences!.getBool(key);
  }
}
