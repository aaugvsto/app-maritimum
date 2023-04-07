import 'package:flutter/material.dart';

//ignore: must_be_immutable
class ListTileWidget extends StatelessWidget {
  String title;
  String dataPartida;
  String dataChegada;
  String preco;

  ListTileWidget({
    Key? key,
    required this.title,
    required this.dataPartida,
    required this.dataChegada,
    required this.preco,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      const InkWell(
                        onTap: null,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  )),
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
