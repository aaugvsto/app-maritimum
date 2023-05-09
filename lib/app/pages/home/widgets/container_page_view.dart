import 'package:flutter/material.dart';

class ContainerPageView extends StatelessWidget {
  const ContainerPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10,
        width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cruzeiro.jpg'),
            fit: BoxFit.fitHeight,
          ),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(80, 0, 0, 0),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.bottomCenter,
            child: Text(
              textAlign: TextAlign.center,
              'Viagem na América Latina por apenas:\n\nR\$ 1.000,00 reais!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
