import 'package:flutter/material.dart';

class ContaPage extends StatelessWidget {
  const ContaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: const Text('Maritimum'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.logout,
              color: Colors.teal,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(
                      Icons.person_outline,
                      color: Colors.teal,
                      size: 36,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 8, 0),
                    child: Text(
                      'Olá, Augusto',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  const Icon(Icons.edit, color: Colors.teal)
                ],
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.teal,
                ),
                title: Text('Meus Dados'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.teal,
                ),
                title: Text('Meus Pedidos'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.teal,
                ),
                title: Text('Atendimento'),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.apple,
                    color: Colors.grey,
                  ),
                  Text(
                    ' Developed by Augusto Assis @ 2023 ',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    Icons.android,
                    color: Colors.green,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}