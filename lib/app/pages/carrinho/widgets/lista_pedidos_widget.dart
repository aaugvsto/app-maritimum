import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/pages/carrinho/widgets/list_tile_pedido_widget.dart';
import 'package:flutter/material.dart';

class ListaPedidosWidget extends StatelessWidget {
  final List<CruzeiroPedido> lista;

  const ListaPedidosWidget({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.separated(
        itemCount: lista.length,
        separatorBuilder: (_, int index) => const Divider(),
        itemBuilder: (_, int index) {
          final CruzeiroPedido item = lista[index];
          return ListTilePedido(item: item);
        },
      ),
    );
  }
}
