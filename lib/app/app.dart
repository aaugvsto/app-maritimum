import 'package:app/app/pages/dashboard/dashboard_bidings.dart';
import 'package:app/app/pages/dashboard/dashboard_page.dart';
import 'package:app/app/pages/login/login_bidings.dart';
import 'package:app/app/pages/login/login_page.dart';
import 'package:app/app/pages/register/register_bindings.dart';
import 'package:app/app/pages/register/register_page.dart';
import 'package:app/app/pages/viagem_detalhe/viagem_detalhe_bindings.dart';
import 'package:app/app/pages/viagem_detalhe/viagem_detalhe_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.teal,
          fontFamily:
              GoogleFonts.openSans(fontWeight: FontWeight.w600).fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/',
            page: () => const LoginPage(),
            binding: LoginBindings(),
          ),
          GetPage(
            name: '/home',
            page: () => const DashboardPage(),
            binding: DashboardBindings(),
          ),
          GetPage(
            name: '/register',
            page: () => const RegisterPage(),
            binding: RegisterBinginds(),
          ),
          GetPage(
            name: '/detalhes',
            page: () => ViagemDetalhePage(),
            binding: ViagemDetalhesBinding(),
          ),
        ],
      ),
    );
  }
}
