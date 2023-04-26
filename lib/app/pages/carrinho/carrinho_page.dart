import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:app/app/pages/carrinho/widgets/lista_pedidos_widget.dart';
import 'package:app/app/pages/carrinho/widgets/resumo_pedido_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrinhoPage extends GetView<CarrinhoController> {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Meu Carrinho',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
              ),
              ListaPedidosWidget(),
              Divider(),
              ResumoPedidoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
