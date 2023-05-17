import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/models/pessoa_model.dart';

abstract class IPessoaRepository {
  Future<bool> login(String email, String senha);
  Future<bool> register(Pessoa pessoa);
  Future<List<Cruzeiro?>> getFavorites(String email);
  Future<Pessoa?> getByEmail(String email);
  Future<bool> removeFavorite(int idCruzeiro, String userEmail);
  Future<bool> addFavorite(int idCruzeiro, String userEmail);
  Future<Cartao?> getCartoes(String email);
}
