import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:get/get.dart';

class MetodoPagamentosController extends GetxController with StateMixin {
  final ICardRepository _cardRepository;

  MetodoPagamentosController(this._cardRepository);

  @override
  void onInit() async {
    super.onInit();
    await findUserCards();
  }

  Future<void> findUserCards() async {
    change([], status: RxStatus.loading());
    List<Cartao> cardsUsers = await _cardRepository.findCardsCurrentUser();
    change(cardsUsers, status: RxStatus.success());
  }

  Future<void> removeCard(String numeroCartao) async {
    var res = await _cardRepository.removeCard(numeroCartao);

    if (res) {
      change(
        await _cardRepository.findCardsCurrentUser(),
        status: RxStatus.success(),
      );
    }
  }
}
