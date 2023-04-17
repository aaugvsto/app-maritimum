import 'dart:convert';

import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
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

      return lista;
    } else {
      throw Exception('Error!');
    }
  }

  @override
  Future<bool> createOrUpdate() {
    throw UnimplementedError();
  }

  @override
  Future<List<Cruzeiro>> findById() {
    throw UnimplementedError();
  }
}
