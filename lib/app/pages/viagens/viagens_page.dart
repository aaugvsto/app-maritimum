import 'package:app/app/pages/viagens/viagens_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/cruzeiro_model.dart';
import '../../widgets/list_tile_widget.dart';

class ViagensPage extends GetView<ViagensController> {
  const ViagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final Cruzeiro item = state[index];
            return ListTileWidget(
              title: item.nomeExpedicao,
              dataPartida: DateFormat.yMd().format(item.dataChegada),
              dataChegada: DateFormat.yMd().format(item.dataPartida),
              preco: item.preco.toStringAsFixed(2),
            );
          },
        ),
        onError: (error) {
          return Center(child: Text(error.toString()));
        },
      ),
    );
  }
}
