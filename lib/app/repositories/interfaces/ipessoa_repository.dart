import 'package:app/app/models/pessoa_model.dart';

abstract class IPessoaRepository {
  Future<bool> login(String email, String senha);
  Future<bool> register(Pessoa pessoa);
}
