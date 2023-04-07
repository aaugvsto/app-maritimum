import 'package:app/app/pages/login/login_controller.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/repositories/pessoa_repository.dart';

import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<IPessoaRepository>(PessoaRepository());
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
  }
}
