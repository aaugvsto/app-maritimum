import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:get/get.dart';

class ViagemDetalheController extends GetxController with StateMixin {
  final ICarrinhoRepository _carrinhoRepository;
  final CarrinhoController _carrinhoController;

  ViagemDetalheController(
    this._carrinhoRepository,
    this._carrinhoController,
  );

  @override
  onInit() {
    super.onInit();
    change([], status: RxStatus.success());
  }

  Future<void> addInCarrinho(Cruzeiro cruzeiro) async {
    change([], status: RxStatus.loading());

    var pedido = CruzeiroPedido(
      idCruzeiro: cruzeiro.id,
      nomeExpedicao: cruzeiro.nomeExpedicao,
      quantidade: 1,
      valorUnitario: cruzeiro.preco,
      valorTotal: cruzeiro.preco * 1,
    );

    await _carrinhoRepository.addInCarrinhoUser(pedido);
    await _carrinhoController.getCarrinhoUser();
    change([], status: RxStatus.success());
  }
}
