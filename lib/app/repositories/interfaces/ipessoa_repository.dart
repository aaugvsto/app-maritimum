import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/interfaces/ibase_repository.dart';

abstract class IPessoaRepository implements IBaseInferface<Pessoa> {
  Future<bool> login(String email, String senha);
  Future<bool> register(Pessoa pessoa);
  Future<List<Cruzeiro?>> getFavorites(String email);
  Future<Pessoa?> getByEmail(String email);
}
