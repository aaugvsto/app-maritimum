import 'package:app/app/models/cupom_model.dart';
import 'package:app/app/repositories/interfaces/icupom_repository.dart';
import 'package:http/http.dart' as http;

class CupomRepository implements ICupomRepository {
  final String _url = '192.168.18.253:3231';

  @override
  Future<Cupom?> findByCodigo(String codigo) async {
    Map<String, String> queryParameters = {'codigo': codigo};

    final uri = Uri.http(_url, '/api/Cupom/GetByCodigo', queryParameters);
    Map<String, String> headers = {'Content-Type': 'application/json'};

    var res = await http.get(uri, headers: headers);

    if (res.statusCode == 200) {
      var cupom = Cupom.fromJson(res.body);
      return cupom;
    }

    return null;
  }
}
