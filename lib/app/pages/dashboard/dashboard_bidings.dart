import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:app/app/pages/conta/conta_controller.dart';
import 'package:app/app/pages/favoritos/favoritos_controller.dart';
import 'package:app/app/pages/viagens/viagens_controller.dart';
import 'package:app/app/repositories/carrinho_repository.dart';
import 'package:app/app/repositories/cruzeiro_repository.dart';
import 'package:app/app/repositories/cupom_repository.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:app/app/repositories/interfaces/icupom_repository.dart';
import 'package:app/app/repositories/interfaces/ipasssagem_repository.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/repositories/passagem_repository.dart';
import 'package:app/app/repositories/pessoa_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    // Repositories

    Get.lazyPut<ICruzeiroRepository>(() => CruzeiroRepository());
    Get.lazyPut<IPessoaRepository>(() => PessoaRepository());
    Get.lazyPut<ICarrinhoRepository>(
        () => CarrinhoRepository(Hive.box('Pedidos')));
    Get.lazyPut<ICupomRepository>(() => CupomRepository());
    Get.lazyPut<IPassagemRepository>(() => PassagemRepository());

    // Controllers

    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<FavoritosController>(() => FavoritosController(Get.find()));
    Get.lazyPut<ViagensController>(
        () => ViagensController(Get.find(), Get.find(), Get.find()));
    Get.lazyPut<ContaController>(() => ContaController());
    Get.lazyPut<CarrinhoController>(
        () => CarrinhoController(Get.find(), Get.find()));
  }
}
