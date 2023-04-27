import 'package:app/app/pages/viagem_detalhe/viagem_detalhe_controller.dart';
import 'package:app/app/repositories/carrinho_repository.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ViagemDetalhesBinding implements Bindings {
  @override
  void dependencies() async {
    // Repos

    Get.lazyPut<ICarrinhoRepository>(
        () => CarrinhoRepository(Hive.box('pedidos')));

    // Controllers

    Get.lazyPut<ViagemDetalheController>(
        () => ViagemDetalheController(Get.find(), Get.find()));
  }
}
