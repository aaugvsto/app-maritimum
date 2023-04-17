import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:get/get.dart';

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
}
