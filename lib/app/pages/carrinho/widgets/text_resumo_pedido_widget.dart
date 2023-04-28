import 'package:flutter/widgets.dart';

class TextResumoPedidoWidget extends StatelessWidget {
  final String title;
  final double valor;
  final bool bold;

  const TextResumoPedidoWidget({
    super.key,
    required this.title,
    required this.valor,
    this.bold = false,
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
          'R\$ ${valor.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 16, fontWeight: bold ? FontWeight.w900 : null),
        ),
      ],
    );
  }
}
