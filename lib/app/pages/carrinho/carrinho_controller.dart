import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/models/resumo_pedido.dart';
import 'package:app/app/pages/carrinho/widgets/list_tile_pedido_widget.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:get/get.dart';

class CarrinhoController extends GetxController with StateMixin {
  final ICarrinhoRepository _carrinhoRepository;

  CarrinhoController(this._carrinhoRepository);

  double subTotal = 0;
  double descontos = 0;

  @override
  void onInit() {
    super.onInit();
    getCarrinhoUser();
  }

  Future<void> getCarrinhoUser() async {
    change([], status: RxStatus.loading());

    var carrinho = await _carrinhoRepository.getListaUserPedidos();
    List<ListTilePedido> carrinhoPedidos = [];

    subTotal = 0;

    for (var element in carrinho) {
      carrinhoPedidos.add(
        ListTilePedido(
          item: element,
          carrinhoController: this,
        ),
      );
      subTotal += element.valorUnitario * element.quantidade;
    }

    var resumo = ResumoPedido(
      subTotal: subTotal,
      descontos: descontos,
      vlrTotal: subTotal - descontos,
    );

    var res = carrinhoPedidos.isNotEmpty
        ? {
            'carrinho': carrinhoPedidos,
            'resumo': resumo,
          }
        : [];

    change(
      res,
      status: res.runtimeType == List ? RxStatus.empty() : RxStatus.success(),
    );
  }

  Future<void> updateOrRemovePedido({
    required CruzeiroPedido pedido,
    bool isAdd = false,
  }) async {
    if (isAdd) pedido.quantidade += 1;
    if (!isAdd) pedido.quantidade -= 1;

    await _carrinhoRepository.updateOrRemovePedido(pedido);

    onInit();

    update();
  }
}
