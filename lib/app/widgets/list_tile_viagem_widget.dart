// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ListTileViagemWidget extends StatelessWidget {
  String title;
  String dataPartida;
  String dataChegada;
  String preco;
  Function()? onTap;
  IconData favoriteIcon;

  ListTileViagemWidget({
    Key? key,
    required this.title,
    required this.dataPartida,
    required this.dataChegada,
    required this.preco,
    this.onTap,
    required this.favoriteIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            Container(
              height: 125,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cruzeiro.jpg"),
                      fit: BoxFit.fitWidth,
                      opacity: .8),
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Text(
                        title,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: onTap,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            favoriteIcon,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(12)),
                color: Colors.white,
              ),
              height: 125,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        'de\n$dataPartida\naté\n$dataChegada',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'R\$ \n$preco',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
