import 'package:app/app/models/cruzeiro_model.dart';
import 'package:app/app/pages/viagens/viagens_controller.dart';
import 'package:app/app/widgets/list_tile_viagem_widget.dart';
import 'package:app/app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViagensPage extends GetView<ViagensController> {
  const ViagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Material(
              elevation: 2,
              child: Container(
                color: Colors.teal,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormFieldWidget(
                    onChanged: (value) => controller.findCruzeiros(nome: value),
                    textInputType: TextInputType.name,
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Buscar Cruzeiros',
                    borderColor: Colors.grey,
                  ),
                ),
              ),
            ),
            controller.obx(
              (state) => Expanded(
                child: RefreshIndicator(
                  color: Colors.teal,
                  onRefresh: controller.findCruzeiros,
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (_, index) {
                      final Cruzeiro item = state[index];
                      return InkWell(
                        onTap: () => Get.toNamed('/detalhes', arguments: item),
                        child: ListTileViagemWidget(
                          title: item.nomeExpedicao,
                          dataPartida: DateFormat.yMd()
                              .format(DateTime.parse(item.dataPartida)),
                          dataChegada: DateFormat.yMd()
                              .format(DateTime.parse(item.dataChegada)),
                          preco: item.preco.toStringAsFixed(2),
                          onTap: () {
                            controller.addOrRemoveInFavorites(
                              item,
                              false,
                            );
                          },
                          favoriteIcon: item.userFavorited
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                        ),
                      );
                    },
                  ),
                ),
              ),
              onEmpty: Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.findCruzeiros,
                  child: ListView(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Icon(Icons.search_off_rounded, size: 60),
                            Text(
                              'Nenhum cruzeiro encontrado',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onError: (error) {
                controller.findCruzeiros();
                return Center(child: Text(''));
              },
            )
          ],
        ),
      ),
    );
  }
}
