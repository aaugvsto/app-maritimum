import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final String _key = 'key';

  static saveUser(int id, String email, String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode(
          {'userId': id, 'userEmail': email, 'name': name, 'isAuth': true}),
    );
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);
    if (jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }
    return false;
  }

  static Future<bool> clear() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<String> getCurrentUser() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);

    var curUser = jsonDecode(jsonResult!);
    return curUser['userEmail'];
  }

  static Future<String> getCurrentUserName() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString(_key);

    var curUser = jsonDecode(jsonResult!);
    return curUser['name'];
  }
}
