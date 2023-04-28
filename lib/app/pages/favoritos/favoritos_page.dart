import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/pages/favoritos/favoritos_controller.dart';
import 'package:app/app/widgets/list_tile_viagem_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FavoritosPage extends GetView<FavoritosController> {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.teal,
      onRefresh: controller.getUserFavorites,
      child: controller.obx(
        (state) => Scaffold(
          body: ListView.builder(
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
                onTap: () => controller.removeFavorite(item),
                favoriteIcon: Icons.favorite,
              );
            },
          ),
        ),
        onEmpty: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.heart_broken_rounded,
                  color: Colors.red,
                  size: 52,
                ),
                Text(
                  'Nada a exibir aqui\nVocê ainda não tem favoritos',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        onError: (error) {
          return const Text(
            'Erro ao remover favorito, por favor recarregue a tela',
          );
        },
      ),
    );
  }
}
