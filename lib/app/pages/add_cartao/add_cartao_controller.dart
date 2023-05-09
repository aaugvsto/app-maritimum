import 'package:app/app/models/cartao_model.dart';
import 'package:app/app/pages/metodos_pagamentos/metodos_pagamentos_controller.dart';
import 'package:app/app/repositories/interfaces/icards_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AddCartaoController extends GetxController with StateMixin {
  final ICardRepository _cardRepository;
  final MetodoPagamentosController _metodoPagamentosController;

  AddCartaoController(this._cardRepository, this._metodoPagamentosController);

  final GlobalKey<FormState> addCardForm = GlobalKey<FormState>();
  late TextEditingController dtValidadeController;

  String numeroCartao = '';
  String dataValidade = '';
  String cvv = '';
  String nomeTitular = '';
  String cpfOrCnpj = '';
  String apelido = '';
  String bandeira = '';
  String bandeiraPath = '';

  @override
  void onInit() {
    super.onInit();
    dtValidadeController = TextEditingController();
    change([], status: RxStatus.empty());
  }

  Future<void> findCardBrand(int cardNumber) async {
    var res = await _cardRepository.findCardBrand(cardNumber);
    if (res != null) {
      bandeira = res.split('/')[2];
      bandeiraPath = res;
      change(res, status: RxStatus.success());
    }
  }

  changeStatus(dynamic content, RxStatus status) {
    change(content, status: status);
  }

  Future<DateTime?> showDateTimePicker(BuildContext context) async {
    DateTime dateTime = DateTime.now();

    return await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(dateTime.year),
      lastDate: DateTime(dateTime.year + 20),
      locale: const Locale('pt'),
      builder: (BuildContext context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
  }

  saveDate(DateTime? date) {
    if (date != null) {
      String formatedData = DateFormat('dd-MM-yyyy').format(date);
      dataValidade = formatedData;
      dtValidadeController.text = formatedData;
    }
  }

  String? validaNumeroCartao(String? text) {
    if (text == null) return 'O número do cartão é obrigatório!';
    if (text.length < 16) return 'Número do cartão deve ter 16 dígitos!';

    return null;
  }

  String? validaDataValidade(String text) {
    if (text.isEmpty) {
      return 'Insira a data de validade do cartão';
    }
    return null;
  }

  String? validaCVV(String? text) {
    if (text == null) return 'Digite o número de CVV do cartão!';
    if (text.length < 3) return 'O número de CVV contém 3 digitos';

    return null;
  }

  String? validaNomeTitular(String? text) {
    if (text == null) return 'Digite o nome do titular escrito no cartão!';

    return null;
  }

  String? validaCPFandCNPJ(String? text) {
    if (text == null) return 'Digite o CPF ou CNPJ do titular do cartão!';
    if (text.length < 11) return 'O CPF precisa conter 11 dígitos!';
    if (text.length > 11 && text.length < 14) {
      return 'O CPNJ precisa conter 14 dígitos!';
    }

    return null;
  }

  salvaNumeroCartao(String numeroCartao) {
    this.numeroCartao = numeroCartao;
    if (numeroCartao.length == 16) {
      findCardBrand(int.parse(numeroCartao));
    }
  }

  salvaCVV(String cvv) {
    this.cvv = cvv;
  }

  salvaNomeTitular(String nomeTitular) {
    this.nomeTitular = nomeTitular;
  }

  salvaCPForCNPJ(String cpfOrCnpj) {
    this.cpfOrCnpj = cpfOrCnpj;
  }

  salvaApelidoCartao(String apelido) {
    this.apelido = apelido;
  }

  Future<void> submitForm() async {
    bool isFormValid = addCardForm.currentState!.validate();

    if (isFormValid) {
      Cartao newCard = _createCard();
      var res = await _cardRepository.createOrUpdate(cartao: newCard);

      if (res) {
        addCardForm.currentState!.reset();
        _metodoPagamentosController.onInit();
        Get.back();
      }
    }
  }

  Cartao _createCard() {
    List<String> dataSplit = dataValidade.split('-');
    String dataCorreta = '${dataSplit[2]}-${dataSplit[1]}-${dataSplit[0]}';

    return Cartao(
      bandeira: bandeira,
      bandeiraPath: bandeiraPath,
      numero: numeroCartao,
      cvv: cvv,
      dtValidade: DateTime.parse(dataCorreta),
      apelido: apelido,
      nomeTitular: nomeTitular,
    );
  }
}
