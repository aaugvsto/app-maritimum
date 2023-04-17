import 'package:app/app/pages/favoritos/favoritos_controller.dart';
import 'package:app/app/pages/viagens/viagens_controller.dart';
import 'package:app/app/repositories/cruzeiro_repository.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:get/get.dart';
import '../conta/conta_controller.dart';
import 'dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ICruzeiroRepository>(() => CruzeiroRepository());
    Get.lazyPut<ViagensController>(() => ViagensController(Get.find()));
    Get.lazyPut<ContaController>(() => ContaController());
    Get.lazyPut<FavoritoController>(() => FavoritoController());
  }
}
