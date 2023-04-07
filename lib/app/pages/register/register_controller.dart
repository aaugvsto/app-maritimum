import 'package:app/app/models/pessoa_model.dart';
import 'package:app/app/repositories/interfaces/ipessoa_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with StateMixin {
  final IPessoaRepository _iPessoaRepository;

  RegisterController(this._iPessoaRepository);

  @override
  void onInit() {
    super.onInit();
    getListDropdown();
  }

  List<DropdownMenuItem> listDropdownItems = [];
  final selectedSexoOption = 'Masculino'.obs;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  final TextEditingController documentoController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  List<DropdownMenuItem> getListDropdown() {
    change([], status: RxStatus.loading());
    final List<String> _dropdownItems = ['Masculino', 'Feminino', 'Outro'];

    for (var item in _dropdownItems) {
      listDropdownItems.add(
        DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        ),
      );
    }
    change([], status: RxStatus.success());

    return listDropdownItems;
  }

  void setSelected(String value) {
    selectedSexoOption.value = value;
    update();
  }

  void register() async {
    int sexoId = getSexoId(selectedSexoOption.value);

    Pessoa _pessoa = Pessoa(
      id: 0,
      documento: documentoController.text,
      email: emailController.text,
      idade: int.parse(idadeController.text),
      nome: nomeController.text,
      sexoPessoaId: sexoId,
      senha: senhaController.text,
    );

    bool res = await _iPessoaRepository.register(_pessoa);

    res ? Get.offAllNamed('/') : Get.offAllNamed('/register');
  }
}

int getSexoId(String value) {
  int sexoId = 0;

  switch (value) {
    case 'Masculino':
      {
        sexoId = 1;
        break;
      }
    case 'Feminino':
      {
        sexoId = 2;
        break;
      }
    case 'Outro':
      {
        sexoId = 3;
        break;
      }
  }

  return sexoId;
}
