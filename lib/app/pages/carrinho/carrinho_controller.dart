import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/models/cupom_model.dart';
import 'package:app/app/models/resumo_pedido.dart';
import 'package:app/app/pages/carrinho/widgets/list_tile_pedido_widget.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:app/app/repositories/interfaces/icupom_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrinhoController extends GetxController with StateMixin {
  final ICarrinhoRepository _carrinhoRepository;
  final ICupomRepository _cupomRepository;

  CarrinhoController(this._carrinhoRepository, this._cupomRepository);

  double subTotal = 0;
  double descontos = 0;
  List<CruzeiroPedido> listaPedidos = [];
  late TextEditingController cupomController;

  @override
  void onInit() async {
    super.onInit();
    cupomController = TextEditingController();
    await getListaCarrinhoCurUser();
    await getCarrinhoUser();
  }

  Future<void> getCarrinhoUser() async {
    change([], status: RxStatus.loading());

    var carrinho = listaPedidos;
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
      descontos: (subTotal * descontos),
      vlrTotal: subTotal - (subTotal * descontos),
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

  Future<void> findCupom(String cupom) async {
    Cupom? res = await _cupomRepository.findByCodigo(cupom.trim());
    if (res != null) {
      descontos = res.porcentagemDesconto / 100;
      onInit();
    }
  }

  Future<void> getListaCarrinhoCurUser() async {
    listaPedidos = await _carrinhoRepository.getListaUserPedidos();
  }
}
