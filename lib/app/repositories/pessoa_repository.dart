import 'dart:convert';

import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/cruzeiro_repository.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:http/http.dart' as http;

class PessoaRepository implements IPessoaRepository {
  final String _url = '192.168.18.106:3231';

  @override
  Future<bool> login(String email, String password) async {
    final Map<String, dynamic> queryParameters = {
      'email': email,
      'password': password,
    };

    final uri = Uri.http(_url, 'api/Pessoa/GetByEmail', queryParameters);

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      await SharedPrefService.saveUser(body['id'], email, body['nome']);
      return true;
    }

    return false;
  }

  @override
  Future<bool> register(Pessoa pessoa) async {
    final uri = Uri.http(_url, 'api/Pessoa/CreateOrUpdate');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    final body = pessoa.toJson();

    final res = await http.post(uri, body: body, headers: headers);

    if (res.statusCode == 200) return true;

    return false;
  }

  @override
  Future<List<Cruzeiro?>> getFavorites(String email) async {
    var user = await getByEmail(email);

    if (user != null) {
      Map<String, String> queryParameters = {'pessoaId': user.id.toString()};

      final uri =
          Uri.http(_url, 'api/PessoaFavoritos/GetByPessoaId', queryParameters);
      Map<String, String> headers = {'Content-Type': 'application/json'};

      final res = await http.get(uri, headers: headers);

      if (res.statusCode == 200) {
        List<dynamic> resBody = jsonDecode(res.body);
        List<Cruzeiro?> lista = [];

        CruzeiroRepository cruzeiroRepository = CruzeiroRepository();

        for (var item in resBody) {
          lista.add(
            await cruzeiroRepository.findById(item['cruzeiroId']),
          );
        }
        return lista;
      }
    }
    return [];
  }

  @override
  Future<Pessoa?> getByEmail(String email) async {
    Map<String, String> queryParameters = {'email': email};

    final uri = Uri.http(_url, 'api/Pessoa/GetByEmail', queryParameters);

    Map<String, String> headers = {'Content-Type': 'application/json'};

    final res = await http.get(uri, headers: headers);

    if (res.statusCode == 200) return Pessoa.fromJson(res.body);

    return null;
  }

  @override
  Future<bool> removeFavorite(int cruzeiroId, String userEmail) async {
    Map<String, String> queryParameters = {
      'idCruzeiro': cruzeiroId.toString(),
      'userEmail': userEmail,
    };

    final uri = Uri.http(_url, 'api/PessoaFavoritos/Delete', queryParameters);
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      final res = await http.post(uri, headers: headers);

      if (res.statusCode == 200) return true;

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> addFavorite(int idCruzeiro, String email) async {
    var user = await getByEmail(email);

    if (user != null) {
      final uri = Uri.http(
        _url,
        'api/PessoaFavoritos/Create',
      );

      try {
        final res = await http.post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'id': 0,
            'cruzeiroId': idCruzeiro,
            'pessoaId': user.id,
          }),
        );

        if (res.statusCode == 200) return true;

        return false;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  @override
  Future<bool> createOrUpdate() {
    throw UnimplementedError();
  }

  @override
  Future<Pessoa?> findById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Pessoa>> getAll() {
    throw UnimplementedError();
  }

  @override
  Future<Cartao?> getCartoes(String email) {
    return Future.value(null);
  }
}
