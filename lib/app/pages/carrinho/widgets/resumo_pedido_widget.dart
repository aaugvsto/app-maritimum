import 'package:app/app/models/resumo_pedido.dart';
import 'package:app/app/pages/carrinho/widgets/text_resumo_pedido_widget.dart';
import 'package:flutter/material.dart';

class ResumoPedidoWidget extends StatelessWidget {
  final ResumoPedido resumo;

  const ResumoPedidoWidget({super.key, required this.resumo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Resumo',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        SizedBox(height: 16),
        TextResumoPedidoWidget(title: 'Subtotal', valor: resumo.subTotal),
        TextResumoPedidoWidget(
          title: 'Descontos',
          valor: resumo.descontos,
          isDesconto: true,
        ),
        Divider(),
        TextResumoPedidoWidget(
          title: 'Total',
          valor: resumo.vlrTotal,
          bold: true,
        ),
        Divider(),
      ],
    );
  }
}
