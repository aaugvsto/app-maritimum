import 'dart:convert';

import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:http/http.dart' as http;

class CruzeiroRepository implements ICruzeiroRepository {
  @override
  Future<List<Cruzeiro>> getAll() async {
    const url = "http://192.168.18.106:3231/api/Cruzeiro/GetAll";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> responseBody = jsonDecode(response.body);
      List<Cruzeiro> lista = responseBody
          .map<Cruzeiro>(
            (resp) => Cruzeiro.fromMap(resp),
          )
          .toList();

      List<Cruzeiro> userFavorites = await SharedPrefService.getUserFavorites();

      if (userFavorites.isNotEmpty) {
        for (var item in lista) {
          for (var itemf in userFavorites) {
            if (item.id == itemf.id) {
              item.userFavorited = true;
            }
          }
        }
      }

      return lista;
    } else {
      throw Exception('Error!');
    }
  }
}
