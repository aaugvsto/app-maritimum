import 'package:flutter/material.dart';

class CupomSpace extends StatelessWidget {
  const CupomSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Text(
          'Cupom',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        ListTile(
          leading: Icon(
            Icons.local_offer_rounded,
            color: Colors.teal,
          ),
          title: Text('NOME CUPOM'),
          subtitle: Text('DESCRICAO'),
          trailing: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '10%',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
