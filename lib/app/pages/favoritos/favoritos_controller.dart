import 'package:app/app/models/cruzeiro_model.dart';
import 'package:get/get.dart';

class FavoritoController extends GetxController with StateMixin {
  @override
  onInit() {
    super.onInit();
    getUserFavorites();
  }

  putOrRemoveFavorite(Cruzeiro cruzeiro) async {}

  Future<void> getUserFavorites() async {}
}
