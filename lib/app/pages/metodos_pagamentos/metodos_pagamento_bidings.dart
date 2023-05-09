import 'package:app/app/pages/metodos_pagamentos/metodos_pagamentos_controller.dart';
import 'package:app/app/repositories/card_repository.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MetodoPagamentoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICardRepository>(() => CardRepository(Hive.box('cartoes')));
    Get.lazyPut<MetodoPagamentosController>(
      () => MetodoPagamentosController(Get.find()),
    );
  }
}
