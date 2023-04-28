import 'package:app/app/pages/register/register_controller.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/repositories/pessoa_repository.dart';
import 'package:get/get.dart';

class RegisterBinginds implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPessoaRepository>(() => PessoaRepository());
    Get.lazyPut<RegisterController>(() => RegisterController(Get.find()));
  }
}
