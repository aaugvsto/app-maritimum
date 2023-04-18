import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:get/get.dart';

class FavoritoController extends GetxController with StateMixin {
  final IPessoaRepository _pessoaRepository;

  FavoritoController(this._pessoaRepository);

  List<Cruzeiro?> favorites = [];

  @override
  onInit() {
    super.onInit();
    getUserFavorites();
  }

  putOrRemoveFavorite(Cruzeiro cruzeiro) async {}

  Future<void> getUserFavorites() async {
    change([], status: RxStatus.loading());

    var curUser = await SharedPrefService.getCurrentUser();
    if (curUser != null) {
      favorites = await _pessoaRepository.getFavorites(curUser);
      if (favorites.isNotEmpty) {
        change(favorites, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } else {
      change([], status: RxStatus.empty());
    }

    update();
  }
}
