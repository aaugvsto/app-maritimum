import 'package:app/app/pages/add_cartao/add_cartao_controller.dart';
import 'package:get/get.dart';

class AddCartaoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCartaoController>(
        () => AddCartaoController(Get.find(), Get.find()));
  }
}
