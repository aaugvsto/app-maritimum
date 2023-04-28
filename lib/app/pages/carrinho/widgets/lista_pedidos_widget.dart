import 'package:app/app/pages/carrinho/widgets/list_tile_pedido_widget.dart';
import 'package:flutter/material.dart';

class ListaPedidosWidget extends StatelessWidget {
  final List<ListTilePedido> lista;

  const ListaPedidosWidget({super.key, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: lista,
    );
  }
}
