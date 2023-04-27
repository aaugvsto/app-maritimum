import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:get/get.dart';

class CarrinhoController extends GetxController with StateMixin {
  final ICarrinhoRepository _carrinhoRepository;

  CarrinhoController(this._carrinhoRepository);

  @override
  void onInit() {
    super.onInit();
    getCarrinhoUser();
  }

  Future<void> getCarrinhoUser() async {
    change([], status: RxStatus.loading());

    var carrinho = await _carrinhoRepository.getListaUserPedidos();

    change(carrinho, status: RxStatus.success());
  }
}
