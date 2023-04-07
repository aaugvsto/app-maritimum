import 'package:app/app/models/pessoa_model.dart';

abstract class IPessoaRepository {
  Future<Pessoa?> login(String email, String senha);
  Future<bool> register(Pessoa pessoa);
}
