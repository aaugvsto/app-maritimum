import 'package:app/app/models/transacao_model.dart';
import 'package:app/app/repositories/interfaces/ibase_repository.dart';

abstract class ITransacaoRepository {
  Future<bool> create(Transacao transacao);
}
