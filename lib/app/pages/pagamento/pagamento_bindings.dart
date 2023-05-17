import 'package:app/app/pages/loading_transacao/loading_transacao_controller.dart';
import 'package:app/app/pages/pagamento/pagamento_controller.dart';
import 'package:app/app/repositories/card_repository.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:app/app/repositories/interfaces/itransacao_repository.dart';
import 'package:app/app/repositories/transacao_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PagamentoBidings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICardRepository>(() => CardRepository(Hive.box('cartoes')));
    Get.lazyPut<ITransacaoRepository>(() => TransacaoRepository());
    Get.lazyPut<LoadingTransacaoController>(() => LoadingTransacaoController());
    Get.lazyPut<PagamentoController>(() => PagamentoController(
        Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
  }
}
