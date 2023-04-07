import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin {
  late IPessoaRepository pessoaRepository;

  LoginController(this.pessoaRepository);

  RxBool hidePass = true.obs;
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    isAuth();
  }

  void isAuth() async {
    change([], status: RxStatus.loading());

    try {
      var isAuth = await SharedPrefService.isAuth();

      if (isAuth) Get.offAllNamed('/home');
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error('Erro Shared Preferences'));
    }
  }

  void login() async {
    bool pessoa = await pessoaRepository.login(
      emailTextController.text,
      passwordTextController.text,
    );

    if (pessoa) Get.offAllNamed('/home');
  }
}
