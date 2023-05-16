import 'package:app/app/models/passagem_model.dart';
import 'package:app/app/repositories/interfaces/ibase_repository.dart';

abstract class IPassagemRepository implements IBaseInferface<Passagem> {
  Future<List<Passagem>> findByEmail(String email);
}
