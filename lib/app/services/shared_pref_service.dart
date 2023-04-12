import 'dart:convert';

import 'package:app/app/models/cruzeiro_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static final String _key = 'key';

  static saveUser(String key) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode({'user': key, 'isAuth': true}),
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

  static void putInFavorite(Cruzeiro cruzeiro) async {
    var prefs = await SharedPreferences.getInstance();

    var stored = prefs.getString('user_favorites');

    List<Map<String, dynamic>> userFavorites = [];

    if (stored != null) {
      var list = jsonDecode(stored);
      for (var item in list) {
        userFavorites.add(item);
      }
    }

    userFavorites.add(cruzeiro.toMap());

    prefs.remove('user_favorites');

    await prefs.setString('user_favorites', jsonEncode(userFavorites));
  }

  static Future<List<Cruzeiro>> getUserFavorites() async {
    var prefs = await SharedPreferences.getInstance();

    List<Cruzeiro> lista = [];

    if (prefs.getString('user_favorites') != null) {
      var decoded = jsonDecode(prefs.getString('user_favorites')!);

      lista = decoded.map<Cruzeiro>((e) => Cruzeiro.fromMap(e)).toList();
    }

    return lista;
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
}
