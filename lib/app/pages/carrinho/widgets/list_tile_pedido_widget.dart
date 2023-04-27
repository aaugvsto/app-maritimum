import 'package:flutter/material.dart';

import '../../../models/cruzeiro_pedido_model.dart';

class ListTilePedido extends StatefulWidget {
  final CruzeiroPedido item;

  const ListTilePedido({super.key, required this.item});

  @override
  State<ListTilePedido> createState() => _ListTilePedidoState();
}

class _ListTilePedidoState extends State<ListTilePedido> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    children: const [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                      ),
                      Text('1'),
                      IconButton(
                        onPressed: null,
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
                    widget.item.nomeExpedicao,
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
                      widget.item.valorTotal.toString(),
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
    );
  }
}
