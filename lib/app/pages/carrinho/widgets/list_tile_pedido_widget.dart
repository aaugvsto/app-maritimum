import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:flutter/material.dart';

import '../../../models/cruzeiro_pedido_model.dart';

class ListTilePedido extends StatelessWidget {
  final CruzeiroPedido item;
  final CarrinhoController carrinhoController;

  const ListTilePedido({
    super.key,
    required this.item,
    required this.carrinhoController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          height: 180,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage("assets/cruzeiro.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () => carrinhoController
                                .updateOrRemovePedido(pedido: item),
                            icon: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                          ),
                          Text(item.quantidade.toString()),
                          IconButton(
                            onPressed: () =>
                                carrinhoController.updateOrRemovePedido(
                                    pedido: item, isAdd: true),
                            icon: Icon(
                              Icons.add,
                              color: Colors.teal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        item.nomeExpedicao,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'R\$ ${item.valorTotal.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
