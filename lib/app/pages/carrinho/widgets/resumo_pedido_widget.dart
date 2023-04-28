import 'package:app/app/models/resumo_pedido.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:app/app/widgets/text_form_field_widget.dart';
import 'package:app/app/pages/carrinho/widgets/text_resumo_pedido_widget.dart';
import 'package:flutter/material.dart';

class ResumoPedidoWidget extends StatelessWidget {
  final ResumoPedido resumo;

  const ResumoPedidoWidget({super.key, required this.resumo});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Divider(),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Resumo',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        SizedBox(height: 16),
        TextResumoPedidoWidget(title: 'Subtotal', valor: resumo.subTotal),
        TextResumoPedidoWidget(title: 'Descontos', valor: resumo.descontos),
        Divider(),
        TextResumoPedidoWidget(
          title: 'Total',
          valor: resumo.vlrTotal,
          bold: true,
        ),
        SizedBox(height: 16),
        Form(
          child: Column(
            key: _formKey,
            children: [
              SizedBox(height: 6),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('Cupom'),
              ),
              SizedBox(height: 6),
              TextFormFieldWidget(
                textInputType: TextInputType.text,
                hintText: 'Digite o cupom aqui',
              ),
              SizedBox(height: 6)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Container(
            alignment: Alignment.center,
            child: ButtonWidget(
              backgroundColor: Colors.teal,
              iconColor: Colors.white,
              textColor: Colors.white,
              label: 'Finalizar pedido',
              icon: Icons.shopping_bag_rounded,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
