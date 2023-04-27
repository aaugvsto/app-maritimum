import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/pages/viagens/viagens_controller.dart';
import 'package:app/app/widgets/list_tile_viagem_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViagensPage extends GetView<ViagensController> {
  const ViagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => RefreshIndicator(
          onRefresh: controller.findCruzeiros,
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (_, index) {
              final Cruzeiro item = state[index];
              return InkWell(
                onTap: () => Get.toNamed('/detalhes', arguments: item),
                child: ListTileViagemWidget(
                  title: item.nomeExpedicao,
                  dataPartida:
                      DateFormat.yMd().format(DateTime.parse(item.dataPartida)),
                  dataChegada:
                      DateFormat.yMd().format(DateTime.parse(item.dataChegada)),
                  preco: item.preco.toStringAsFixed(2),
                  onTap: () => controller.addOrRemoveInFavorites(item, false),
                  favoriteIcon: item.userFavorited
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                ),
              );
            },
          ),
        ),
        onError: (error) {
          return Center(child: Text(error.toString()));
        },
      ),
    );
  }
}
