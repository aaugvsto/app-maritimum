import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final IPessoaRepository _iPessoaRepository;

  RegisterController(this._iPessoaRepository);

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController documentoController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void register() async {
    Pessoa _pessoa = Pessoa(
      id: 0,
      documento: documentoController.text,
      email: emailController.text,
      idade: int.parse(idadeController.text),
      nome: nomeController.text,
      sexoPessoaId: int.parse(sexoController.text),
      senha: senhaController.text,
    );

    bool res = await _iPessoaRepository.register(_pessoa);

    res ? Get.offAllNamed('/') : Get.offAllNamed('/register');
  }
}
