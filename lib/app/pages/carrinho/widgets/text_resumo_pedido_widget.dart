import 'package:flutter/widgets.dart';

class TextResumoPedidoWidget extends StatelessWidget {
  final String title;
  final double valor;
  final bool bold;
  final bool isDesconto;

  const TextResumoPedidoWidget({
    super.key,
    required this.title,
    required this.valor,
    this.bold = false,
    this.isDesconto = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title:',
          style: TextStyle(fontSize: 16),
        ),
        Text(
          isDesconto
              ? '- R\$ ${valor.toStringAsFixed(2)}'
              : 'R\$ ${valor.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 16, fontWeight: bold ? FontWeight.w900 : null),
        ),
      ],
    );
  }
}
