import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:app/app/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late IPessoaRepository pessoaRepository;

  LoginController(this.pessoaRepository);

  RxBool hidePass = true.obs;
  final passwordTextController = TextEditingController();
  final emailTextController = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    sendTo(await isAuth());
  }

  Future<bool> isAuth() async {
    return await SharedPrefService.isAuth();
  }

  void login() async {
    Pessoa? pessoa = await pessoaRepository.login(
      emailTextController.text,
      passwordTextController.text,
    );

    if (pessoa != null) {
      SharedPrefService.save(emailTextController.text);
      Get.offNamed('/home');
    }
  }

  void sendTo(bool isAuth) {
    if (isAuth) Get.offNamed('/home');
  }
}
