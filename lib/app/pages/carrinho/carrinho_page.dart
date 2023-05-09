import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:app/app/pages/carrinho/widgets/lista_pedidos_widget.dart';
import 'package:app/app/pages/carrinho/widgets/resumo_pedido_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarrinhoPage extends GetView<CarrinhoController> {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Carrinho '),
              Icon(
                Icons.shopping_cart_outlined,
                color: Colors.teal,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ListaPedidosWidget(lista: state['carrinho']),
                ResumoPedidoWidget(resumo: state['resumo'])
              ],
            ),
          ),
        ),
      ),
      onEmpty: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.remove_shopping_cart_outlined,
                size: 48,
                color: Colors.teal,
              ),
              Text(
                'Nada a exibir aqui\nSeu carrinho está vázio',
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
