import 'package:app/app/pages/home/widgets/container_page_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          ContainerPageView(),
          ContainerPageView(),
          ContainerPageView(),
        ],
      ),
    );
  }
}
