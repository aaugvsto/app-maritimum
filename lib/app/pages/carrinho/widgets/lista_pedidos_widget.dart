import 'package:app/app/pages/carrinho/widgets/list_tile_pedido_widget.dart';
import 'package:flutter/material.dart';

class ListaPedidosWidget extends StatelessWidget {
  const ListaPedidosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return const ListTilePedido();
        },
      ),
    );
  }
}
