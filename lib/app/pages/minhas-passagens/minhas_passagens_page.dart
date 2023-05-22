import 'package:app/app/models/passagem_model.dart';
import 'package:app/app/pages/minhas-passagens/minhas_passagens_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinhasPassagensPage extends GetView<MinhasPassagensController> {
  const MinhasPassagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx(
        (listaPedidos) => ListView.builder(
          itemCount: listaPedidos.length,
          itemBuilder: (context, index) {
            final Passagem passagem = listaPedidos[index];
            return ListTile();
          },
        ),
      ),
    );
  }
}
