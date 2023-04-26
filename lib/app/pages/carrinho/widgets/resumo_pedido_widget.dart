import 'package:app/app/widgets/button_widget.dart';
import 'package:app/app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class ResumoPedidoWidget extends StatelessWidget {
  const ResumoPedidoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Column(
      children: [
        Divider(),
        const SizedBox(height: 16),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Resumo',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal'),
            Text('R\$ 1.000.00'),
          ],
        ),
        SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Descontos'),
            Text('R\$ 1.000.00'),
          ],
        ),
        SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Frete'),
            Text('R\$ 1.000.00'),
          ],
        ),
        SizedBox(height: 4),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total'),
            Text('R\$ 1.000.00'),
          ],
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
