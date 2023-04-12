import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:get/get.dart';

import '../../models/cruzeiro_model.dart';

class ViagensController extends GetxController with StateMixin {
  final ICruzeiroRepository _cruzeiroService;

  ViagensController(this._cruzeiroService);

  @override
  void onInit() {
    super.onInit();
    findCruzeiros();
  }

  Future<void> findCruzeiros() async {
    change([], status: RxStatus.loading());

    try {
      final cruzeiros = await _cruzeiroService.getAll();
      change(cruzeiros, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar cruzeiros'));
    }
  }

  putInFavorite(Cruzeiro cruzeiro) {
    SharedPrefService.putInFavorite(cruzeiro);
  }
}
