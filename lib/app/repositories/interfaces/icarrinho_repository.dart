import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:hive/hive.dart';

abstract class ICarrinhoRepository {
  Box box;

  ICarrinhoRepository(this.box);

  Future<void> addInCarrinhoUser(CruzeiroPedido cruzeiroPedido);
  Future<void> removeFromCarrinho(int idCruzeiro);
  Future<List<CruzeiroPedido>> getListaUserPedidos();
}
