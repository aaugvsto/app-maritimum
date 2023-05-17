import 'package:app/app/models/transacao_model.dart';

abstract class ITransacaoRepository {
  Future<bool> create(Transacao transacao);
}
