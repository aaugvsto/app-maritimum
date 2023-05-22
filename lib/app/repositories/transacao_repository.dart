import 'package:app/app/models/transacao_model.dart';
import 'package:app/app/repositories/interfaces/itransacao_repository.dart';
import 'package:http/http.dart' as http;

class TransacaoRepository implements ITransacaoRepository {
  final String _url = '192.168.18.106:3231';

  @override
  Future<bool> create(Transacao transacao) async {
    try {
      Uri _uri = Uri.http(_url, 'api/Transacao/CreateOrUpdate');
      Map<String, String> headers = {'Content-Type': 'application/json'};

      String body = transacao.toJson();
      print(body);

      var res = await http.post(_uri, body: body, headers: headers);

      if (res.statusCode == 200) return true;

      throw Exception('Falha ao criar transação');
    } catch (e) {
      return false;
    }
  }
}
