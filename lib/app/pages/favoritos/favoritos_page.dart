import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/pages/favoritos/favoritos_controller.dart';
import 'package:app/app/widgets/list_tile_viagem_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FavoritosPage extends GetView<FavoritoController> {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.obx(
        (state) => ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final Cruzeiro item = state[index];
            return ListTileViagemWidget(
              title: item.nomeExpedicao,
              dataPartida:
                  DateFormat.yMd().format(DateTime.parse(item.dataPartida)),
              dataChegada:
                  DateFormat.yMd().format(DateTime.parse(item.dataChegada)),
              preco: item.preco.toStringAsFixed(2),
              onTap: () => controller.putOrRemoveFavorite(item),
              favoriteIcon: Icons.favorite,
            );
          },
        ),
        onEmpty: const Text('Você ainda não tem viagens favoritas'),
        onError: (error) {
          return Center(child: Text(error.toString()));
        },
      ),
    );
  }
}
