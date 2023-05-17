import 'package:app/app/pages/loading_transacao/loading_transacao_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TransacaoLoadingPage extends GetView<LoadingTransacaoController> {
  const TransacaoLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LottieBuilder.network(
            'https://assets9.lottiefiles.com/packages/lf20_hc7jmfb0.json',
          ),
          controller.obx((state) => Text(state)),
        ],
      ),
    );
  }
}
