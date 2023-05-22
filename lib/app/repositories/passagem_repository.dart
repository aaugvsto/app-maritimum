import 'dart:convert';

import 'package:app/app/models/passagem_model.dart';
import 'package:app/app/repositories/interfaces/ipasssagem_repository.dart';
import 'package:http/http.dart' as http;

class PassagemRepository implements IPassagemRepository {
  final String _url = '192.168.18.106:3231';

  @override
  Future<bool> createOrUpdate(Passagem passagem) async {
    try {
      Uri _uri = Uri.http(_url, 'api/Passagem/CreateOrUpdate');
      Map<String, String> headers = {'Content-Type': 'application/json'};
      String body = passagem.toJson();

      var res = await http.post(_uri, body: body, headers: headers);

      if (res.statusCode == 200) return true;

      if (passagem.id > 0) throw Exception('Falha ao atualizar passagem');

      throw Exception('Falha ao criar passagem');
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<Passagem>> findByEmail(String email) async {
    try {
      Map<String, String> queryParameters = {'email': email};
      Uri _uri = Uri.http(_url, 'api/Passagem/CreateOrUpdate', queryParameters);
      Map<String, String> headers = {'Content-Type': 'application/json'};

      var res = await http.get(_uri, headers: headers);

      if (res.statusCode == 200) {
        List decodedBody = jsonDecode(res.body);

        List<Passagem> listaPassagensUsuario = [];

        for (var passagem in decodedBody) {
          listaPassagensUsuario.add(Passagem.fromJson(passagem));
        }

        return listaPassagensUsuario;
      }

      throw Exception('Falha ao consultar passagens');
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Passagem?> findById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Passagem>> getAll() {
    throw UnimplementedError();
  }
}
