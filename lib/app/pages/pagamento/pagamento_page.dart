import 'package:app/app/models/cruzeiro_pedido_model.dart';
import 'package:app/app/models/resumo_pedido.dart';
import 'package:app/app/pages/carrinho/widgets/resumo_pedido_widget.dart';
import 'package:app/app/pages/pagamento/pagamento_controller.dart';
import 'package:app/app/pages/pagamento/widgets/cupom_space.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PagamentoPage extends GetView<PagamentoController> {
  final List<CruzeiroPedido> listaPedidos = Get.arguments[0];
  final ResumoPedido resumoPedido = Get.arguments[1];

  PagamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COMPRA'),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 40,
            color: Colors.teal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Items',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listaPedidos.length,
                itemBuilder: (context, index) {
                  CruzeiroPedido pedido = listaPedidos[index];
                  return ListTile(
                    leading: Icon(
                      Icons.anchor_rounded,
                      color: Colors.teal,
                    ),
                    title: Text(pedido.nomeExpedicao),
                    subtitle: Text(
                      'Valor unitário: ${pedido.valorUnitario.toStringAsFixed(2)}',
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'x${pedido.quantidade.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Visibility(
                visible: controller.hasCupom,
                child: CupomSpace(),
              ),
              ResumoPedidoWidget(resumo: resumoPedido),
              Text(
                'Pagamento',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 8),
              controller.obx(
                (cartao) => ListTile(
                  leading: SvgPicture.asset(
                    cartao.bandeiraPath,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(cartao.apelido ??
                      cartao.bandeira.split('.')[0].toUpperCase()),
                  subtitle: Text(
                    '${cartao.numero[12] + cartao.numero[13] + cartao.numero[14] + cartao.numero[15]} - ${cartao.tipo}',
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.swap_vert_rounded,
                      color: Colors.teal,
                      size: 30,
                    ),
                    onPressed: () => controller.showDialogCartoes(context),
                  ),
                ),
                onEmpty: ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Selecionar Cartão'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.swap_vert_rounded,
                      color: Colors.teal,
                      size: 30,
                    ),
                    onPressed: () => controller.showDialogCartoes(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: SizedBox(
          width: double.infinity,
          child: ButtonWidget(
            label: 'Realizar Compra',
            icon: Icons.payment,
            onPressed: () => controller.submeterPedido(
                controller.selectCard!, 1, resumoPedido.vlrTotal),
          ),
        ),
      ),
    );
  }
}
