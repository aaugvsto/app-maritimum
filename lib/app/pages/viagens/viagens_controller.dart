import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/pages/favoritos/favoritos_controller.dart';
import 'package:app/app/repositories/interfaces/icruzeiro_repository.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:get/get.dart';

class ViagensController extends GetxController with StateMixin {
  final ICruzeiroRepository _cruzeiroService;
  final IPessoaRepository _pessoaRepository;
  final FavoritosController _favoritosController;

  ViagensController(
    this._cruzeiroService,
    this._pessoaRepository,
    this._favoritosController,
  );

  List<Cruzeiro?> favorites = [];

  @override
  void onInit() {
    super.onInit();
    findCruzeiros();
  }

  Future<void> findCruzeiros({String? nome}) async {
    change([], status: RxStatus.loading());

    // TODO: Fazer repository de favoritos
    //var curUser = await SharedPrefService.getCurrentUser();

    try {
      //final userFavorites = await _pessoaRepository.getFavorites(curUser);
      final cruzeiros = await _cruzeiroService.getAll();

      // if (cruzeiros.isNotEmpty && userFavorites.isNotEmpty) {
      //   for (Cruzeiro cruzeiro in cruzeiros) {
      //     bool isFavorited = userFavorites
      //         .where((element) => element!.id == cruzeiro.id)
      //         .isNotEmpty;

      //     if (isFavorited) cruzeiro.userFavorited = true;
      //   }
      // }

      var filteredList = [];
      if (nome != null) {
        for (var item in cruzeiros) {
          if (item.nomeExpedicao.contains(nome)) filteredList.add(item);
        }
      }

      var res =
          !filteredList.isNotEmpty && nome != null ? filteredList : cruzeiros;

      change(
        res,
        status: res.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
      );
    } catch (e) {
      change([], status: RxStatus.error('Error ao buscar cruzeiros'));
    }
  }

  Future<void> addOrRemoveInFavorites(
      Cruzeiro cruzeiro, bool isFavoritePage) async {
    var userEmail = await SharedPrefService.getCurrentUser();

    if (!cruzeiro.userFavorited && !isFavoritePage) {
      try {
        var res = await _pessoaRepository.addFavorite(
          cruzeiro.id,
          userEmail,
        );

        if (res) {
          cruzeiro.userFavorited = true;
          _favoritosController.getUserFavorites();
        }
      } catch (e) {
        change(
          [],
          status: RxStatus.error('Erro ao adicionar cruzeiro aos favoritos'),
        );
      }
    } else {
      var res = await _pessoaRepository.removeFavorite(cruzeiro.id, userEmail);

      if (res) {
        cruzeiro.userFavorited = false;
        _favoritosController.getUserFavorites();
      } else {
        change(
          [],
          status: RxStatus.error('Erro ao remover esse item de favoritos'),
        );
      }
      update();
    }

    update();
  }
}
