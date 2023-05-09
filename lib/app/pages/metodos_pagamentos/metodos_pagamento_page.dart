import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/pages/metodos_pagamentos/metodos_pagamentos_controller.dart';
import 'package:app/app/pages/metodos_pagamentos/widgets/list_tile_card_widget.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MetodoPagamentosPage extends GetView<MetodoPagamentosController> {
  const MetodoPagamentosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAGAMENTOS',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => controller.findUserCards(),
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final Cartao cartao = state[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: ListTileCardWidget(
                          onTap: () {},
                          apelido: cartao.apelido!.length > 1
                              ? cartao.apelido!
                              : cartao.bandeira.split('.')[0].toUpperCase(),
                          bandeiraPath: cartao.bandeiraPath ?? '',
                          tipo: 'Crédito',
                          numerosFinais: cartao.numero[12] +
                              cartao.numero[13] +
                              cartao.numero[14] +
                              cartao.numero[15],
                          onPressed: () => controller.removeCard(cartao.numero),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ButtonWidget(
                label: 'Adicionar novo cartão',
                icon: Icons.add_card_rounded,
                onPressed: () => Get.toNamed('/add-cartao'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
