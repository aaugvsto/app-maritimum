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

    bool contains = carrinhoUser.indexWhere(
            (element) => element.idCruzeiro == cruzeiroPedido.idCruzeiro) >=
        0;

    if (!contains) carrinhoUser.add(cruzeiroPedido);

    await box.put(email, jsonEncode(carrinhoUser));
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

  @override
  Future<void> updateOrRemovePedido(CruzeiroPedido newPedido) async {
    var userPedidos = await getListaUserPedidos();
    String email = await SharedPrefService.getCurrentUser();

    if (newPedido.quantidade < 1) {
      userPedidos.removeWhere(
        (element) => element.idCruzeiro == newPedido.idCruzeiro,
      );
    } else {
      int index = userPedidos
          .indexWhere((element) => element.idCruzeiro == newPedido.idCruzeiro);

      userPedidos.removeAt(index);

      userPedidos.insert(index, newPedido);
    }

    await box.put(email, jsonEncode(userPedidos));
  }

  @override
  Future<CruzeiroPedido> getUserPedido(int cruzeiroId) async {
    var carrinhoUsuario = await getListaUserPedidos();

    CruzeiroPedido pedido = carrinhoUsuario
        .where((element) => element.idCruzeiro == cruzeiroId)
        .first;

    return pedido;
  }

  @override
  Future<void> limparCarrinhoUsuarioLogado() async {
    var userEmail = await SharedPrefService.getCurrentUser();

    await box.put(userEmail, jsonEncode([]));
  }
}
