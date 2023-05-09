import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListTileCardWidget extends StatelessWidget {
  final String apelido;
  final String tipo;
  final String numerosFinais;
  final String bandeiraPath;
  final void Function()? onPressed;
  final Function()? onTap;
  const ListTileCardWidget({
    super.key,
    required this.apelido,
    required this.bandeiraPath,
    required this.tipo,
    required this.numerosFinais,
    required this.onPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: bandeiraPath.isNotEmpty
            ? SvgPicture.asset(
                bandeiraPath,
                height: 50,
              )
            : Icon(Icons.credit_card),
        title: Text(apelido, overflow: TextOverflow.ellipsis),
        subtitle: Text('$numerosFinais - $tipo'),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.delete_forever_outlined),
          color: Colors.red,
        ),
      ),
    );
  }
}
