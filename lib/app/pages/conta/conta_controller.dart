import 'package:get/get.dart';

import '../../services/shared_pref_service.dart';

class ContaController extends GetxController with StateMixin {
  void logout() async {
    change([], status: RxStatus.loading());

    try {
      var logoutRes = await SharedPrefService.clear();

      if (logoutRes) Get.offAllNamed('/');
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro ao fazer logout'));
    }
  }
}
