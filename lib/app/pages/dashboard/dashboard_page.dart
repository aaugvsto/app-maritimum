import 'package:app/app/pages/carrinho/carrinho_page.dart';
import 'package:app/app/pages/dashboard/dashboard_controller.dart';
import 'package:app/app/pages/favoritos/favoritos_page.dart';
import 'package:app/app/pages/home/home_page.dart';
import 'package:app/app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../conta/conta_page.dart';
import '../viagens/viagens_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomePage(),
              ViagensPage(),
              FavoritosPage(),
              CarrinhoPage(),
              ContaPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBarWidget(
            function: controller.changeTabIndex,
            pageIndex: controller.tabIndex,
            tabs: _tabs,
          ),
        );
      },
    );
  }

  final _tabs = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.travel_explore_sharp),
      label: 'Viagens',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite_border_outlined),
      label: 'Favoritos',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      label: 'Carrinho',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Conta',
    )
  ];
}
