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
    return Center(
      child: RefreshIndicator(
        onRefresh: controller.getUserFavorites,
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
                onTap: () => controller.removeFavorite(item),
                favoriteIcon: Icons.favorite,
              );
            },
          ),
          onEmpty: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 60,
                onPressed: controller.getUserFavorites,
                icon: const Icon(Icons.refresh_rounded),
              ),
              const Text(
                'Clique aqui para atualizar a página',
                style: TextStyle(color: Colors.blue),
              ),
              const Text('Você ainda não tem favoritos')
            ],
          ),
          onError: (error) {
            return const Text(
              'Erro ao remover favorito, por favor recarregue a tela',
            );
          },
        ),
      ),
    );
  }
}
