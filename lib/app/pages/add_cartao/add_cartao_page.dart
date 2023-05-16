import 'package:app/app/pages/add_cartao/add_cartao_controller.dart';
import 'package:app/app/pages/add_cartao/widgets/app_bar_add_cartao_page.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:app/app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCartaoPage extends GetView<AddCartaoController> {
  const AddCartaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarAddCartaoPage(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: controller.addCardForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                TextFormFieldWidget(
                  labelText: 'Número do Cartão (somente números)',
                  textInputType: TextInputType.number,
                  marginBottom: true,
                  suffixIcon: controller.obx(
                    (state) => SvgPicture.asset(
                      state,
                      height: 50,
                    ),
                    onEmpty: Icon(Icons.credit_card),
                    onLoading: Icon(Icons.credit_card),
                  ),
                  maxLength: 16,
                  validator: (text) => controller.validaNumeroCartao(text),
                  onChanged: (text) => controller.salvaNumeroCartao(text),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormFieldWidget(
                        controller: controller.dtValidadeController,
                        labelText: 'Data de Validade',
                        marginBottom: true,
                        readOnly: true,
                        prefixIcon: Icon(Icons.calendar_month),
                        onTap: () async {
                          controller.saveDate(
                            await controller.showDateTimePicker(context),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: TextFormFieldWidget(
                        labelText: 'CVV',
                        marginBottom: true,
                        maxLength: 4,
                        validator: (text) => controller.validaCVV(text),
                        onChanged: (text) => controller.salvaCVV(text),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    value: controller.selectedTipoCartao.value,
                    items: controller.listDropdownItems,
                    onChanged: (value) => controller.setSelected(value),
                  ),
                ),
                TextFormFieldWidget(
                  labelText: 'Nome do Titular',
                  marginBottom: true,
                  onChanged: (text) => controller.salvaNomeTitular(text),
                ),
                TextFormFieldWidget(
                  labelText: 'CPF / CNPJ do titular',
                  marginBottom: true,
                  validator: (text) => controller.validaCPFandCNPJ(text),
                  onChanged: (text) => controller.salvaCPForCNPJ(text),
                ),
                TextFormFieldWidget(
                  labelText: 'Apelido do Cartão (opcional)',
                  marginBottom: true,
                  onChanged: (text) => controller.salvaApelidoCartao(text),
                ),
                ButtonWidget(
                  label: 'Salvar',
                  icon: Icons.check,
                  onPressed: () => controller.submitForm(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
