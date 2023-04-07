import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:http/http.dart' as http;

class PessoaRepository implements IPessoaRepository {
  final String _url = '172.27.192.1:3231';

  @override
  Future<bool> login(String email, String password) async {
    final Map<String, dynamic> queryParameters = {
      'email': email,
      'password': password,
    };

    final uri = Uri.http(_url, 'api/Pessoa/GetByEmail', queryParameters);

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      await SharedPrefService.save(email);
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
}
