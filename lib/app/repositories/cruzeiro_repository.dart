import 'dart:convert';

import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:http/http.dart' as http;

class CruzeiroRepository implements ICruzeiroRepository {
  @override
  Future<List<Cruzeiro>> getAll() async {
    const url = "http://172.27.192.1:3231/api/Cruzeiro/GetAll";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> lista = jsonDecode(response.body);
      return lista.map<Cruzeiro>((resp) => Cruzeiro.fromMap(resp)).toList();
    } else {
      throw Exception('Error!');
    }
  }
}
