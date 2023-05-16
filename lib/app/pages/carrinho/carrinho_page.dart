import 'package:app/app/pages/carrinho/carrinho_controller.dart';
import 'package:app/app/pages/carrinho/widgets/lista_pedidos_widget.dart';
import 'package:app/app/pages/carrinho/widgets/resumo_pedido_widget.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:app/app/widgets/text_form_field_widget.dart';
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
                ResumoPedidoWidget(resumo: state['resumo']),
                Column(
                  children: [
                    SizedBox(height: 6),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Cupom'),
                    ),
                    SizedBox(height: 6),
                    TextFormFieldWidget(
                      controller: controller.cupomController,
                      textInputType: TextInputType.text,
                      hintText: 'Digite o cupom aqui',
                      suffixIcon: SizedBox(
                        width: 120,
                        child: InkWell(
                          onTap: () => controller
                              .findCupom(controller.cupomController.text),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Aplicar Cupom',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(
                    alignment: Alignment.center,
                    child: ButtonWidget(
                      backgroundColor: Colors.teal,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      label: 'Ir para pagamento',
                      icon: Icons.directions_boat_rounded,
                      onPressed: () => Get.toNamed(
                        '/pagamento',
                        arguments: [
                          controller.listaPedidos,
                          state['resumo'],
                        ],
                      ),
                    ),
                  ),
                ),
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
