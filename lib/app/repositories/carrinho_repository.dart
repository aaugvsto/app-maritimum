import 'dart:convert';

import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/repositories/interfaces/icarrinho_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:hive/hive.dart';

class CarrinhoRepository implements ICarrinhoRepository {
  @override
  Box box;

  CarrinhoRepository(this.box);

  @override
  Future<void> addInCarrinhoUser(CruzeiroPedido cruzeiroPedido) async {
    String email = await SharedPrefService.getCurrentUser();

    List<CruzeiroPedido> carrinhoUser = await getListaUserPedidos();

    carrinhoUser.add(cruzeiroPedido);

    await box.put(email, jsonEncode(carrinhoUser));
  }

  @override
  Future<void> removeFromCarrinho(int idCruzeiro) async {
    String email = await SharedPrefService.getCurrentUser();

    var pedidos = await box.get('pedidos');

    var userData = await pedidos.get(email);

    List<CruzeiroPedido> pedidosUser = userData!['pedidos'];

    pedidosUser.removeWhere((element) => element.idCruzeiro == idCruzeiro);
  }

  @override
  Future<List<CruzeiroPedido>> getListaUserPedidos() async {
    String email = await SharedPrefService.getCurrentUser();

    List<CruzeiroPedido> carrinhoUsuario = [];

    if (box.get(email) != null) {
      List pedidos = await jsonDecode(box.get(email));

      for (var element in pedidos) {
        carrinhoUsuario.add(CruzeiroPedido.fromJson(element));
      }
    }

    return carrinhoUsuario;
  }
}
