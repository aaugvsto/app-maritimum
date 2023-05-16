import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:hive/hive.dart';

abstract class ICarrinhoRepository {
  Box box;

  ICarrinhoRepository(this.box);

  Future<void> addInCarrinhoUser(CruzeiroPedido cruzeiroPedido);
  Future<List<CruzeiroPedido>> getListaUserPedidos();
  Future<void> updateOrRemovePedido(CruzeiroPedido pedido);
  Future<CruzeiroPedido> getUserPedido(int cruzeiroId);
  Future<void> limparCarrinhoUsuarioLogado();
}
