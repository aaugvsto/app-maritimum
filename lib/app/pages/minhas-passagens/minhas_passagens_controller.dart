import 'package:app/app/models/passagem_model.dart';
import 'package:app/app/repositories/interfaces/ipasssagem_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:get/get.dart';

class MinhasPassagensController extends GetxController with StateMixin {
  final IPassagemRepository _passagemRepository;

  MinhasPassagensController(this._passagemRepository);

  @override
  onInit() async {
    super.onInit();
    await getPassagensUsuarioLogado();
  }

  getPassagensUsuarioLogado() async {
    change([], status: RxStatus.loading());
    String emailUsuarioLogado = await SharedPrefService.getCurrentUser();
    late List<Passagem> passagens;

    passagens = await _passagemRepository.findByEmail(emailUsuarioLogado);
    change(passagens, status: RxStatus.success());
  }
}
