import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:get/get.dart';

class FavoritosController extends GetxController with StateMixin {
  final IPessoaRepository _pessoaRepository;

  FavoritosController(this._pessoaRepository);

  List<Cruzeiro?> favorites = [];

  @override
  onInit() {
    super.onInit();
    getUserFavorites();
  }

  removeFavorite(Cruzeiro cruzeiro) async {
    var userEmail = await SharedPrefService.getCurrentUser();

    await _pessoaRepository.removeFavorite(cruzeiro.id, userEmail);

    getUserFavorites();
    cruzeiro.userFavorited = false;
    update();
  }

  Future<void> getUserFavorites() async {
    change([], status: RxStatus.loading());

    var curUser = await SharedPrefService.getCurrentUser();

    favorites = await _pessoaRepository.getFavorites(curUser);
    if (favorites.isNotEmpty) {
      change(favorites, status: RxStatus.success());
    } else {
      change([], status: RxStatus.empty());
    }
    update();
  }
}
