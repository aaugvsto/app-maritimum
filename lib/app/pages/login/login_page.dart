import 'package:app/app/pages/dashboard/dashboard_page.dart';
import 'package:app/app/pages/login/login_controller.dart';
import 'package:app/app/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.anchor,
                    color: Colors.teal,
                    size: 150,
                  ),
                  Text(
                    'Maritimum',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: GoogleFonts.leckerliOne().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller.emailTextController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Digite seu e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: controller.passwordTextController,
                    obscureText: controller.hidePass.value,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: 'Digite sua senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        backgroundColor: Colors.blueAccent,
                        icon: Icons.person_add_alt_1_outlined,
                        iconColor: Colors.white,
                        label: 'Registrar',
                        onPressed: () => Get.toNamed('/register'),
                        textColor: Colors.white,
                      ),
                      ButtonWidget(
                        backgroundColor: Colors.teal,
                        icon: Icons.login_outlined,
                        iconColor: Colors.white,
                        label: 'Entrar',
                        onPressed: controller.login,
                        textColor: Colors.white,
                      ),
                    ],
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
