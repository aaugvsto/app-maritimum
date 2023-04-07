import 'package:app/app/pages/register/register_controller.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:app/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldWidget(
                    controller: controller.nomeController,
                    hintText: 'Nome completo',
                  ),
                  TextFieldWidget(
                    controller: controller.emailController,
                    hintText: 'Email',
                    paddingTop: 20,
                  ),
                  TextFieldWidget(
                    controller: controller.idadeController,
                    hintText: 'Idade',
                    paddingTop: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      value: controller.selectedSexoOption.value,
                      items: controller.listDropdownItems,
                      onChanged: (value) => controller.setSelected(value),
                    ),
                  ),
                  TextFieldWidget(
                    controller: controller.documentoController,
                    hintText: 'Documento',
                    paddingTop: 20,
                  ),
                  TextFieldWidget(
                    controller: controller.senhaController,
                    hintText: 'Senha',
                    paddingTop: 20,
                  ),
                  ButtonWidget(
                    paddingTop: 20,
                    backgroundColor: Colors.green,
                    icon: Icons.person_add,
                    iconColor: Colors.white,
                    label: 'Registrar',
                    onPressed: controller.register,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
