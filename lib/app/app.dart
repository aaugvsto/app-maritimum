import 'package:app/app/pages/add_cartao/add_cartao_bindings.dart';
import 'package:app/app/pages/add_cartao/add_cartao_page.dart';
import 'package:app/app/pages/dashboard/dashboard_bidings.dart';
import 'package:app/app/pages/dashboard/dashboard_page.dart';
import 'package:app/app/pages/loading_transacao/loading_transacao_page.dart';
import 'package:app/app/pages/login/login_bidings.dart';
import 'package:app/app/pages/login/login_page.dart';
import 'package:app/app/pages/metodos_pagamentos/metodos_pagamento_bidings.dart';
import 'package:app/app/pages/metodos_pagamentos/metodos_pagamento_page.dart';
import 'package:app/app/pages/pagamento/pagamento_bindings.dart';
import 'package:app/app/pages/pagamento/pagamento_page.dart';
import 'package:app/app/pages/register/register_bindings.dart';
import 'package:app/app/pages/register/register_page.dart';
import 'package:app/app/pages/viagem_detalhe/viagem_detalhe_bindings.dart';
import 'package:app/app/pages/viagem_detalhe/viagem_detalhe_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
        supportedLocales: const [
          Locale('pt'),
          Locale('en'),
        ],
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
          GetPage(
            name: '/metodos-pagamento',
            page: () => MetodoPagamentosPage(),
            binding: MetodoPagamentoBindings(),
          ),
          GetPage(
            name: '/add-cartao',
            page: () => AddCartaoPage(),
            binding: AddCartaoBindings(),
          ),
          GetPage(
            name: '/pagamento',
            page: () => PagamentoPage(),
            binding: PagamentoBidings(),
          ),
          GetPage(
            name: '/loading-transacao',
            page: () => TransacaoLoadingPage(),
          )
        ],
      ),
    );
  }
}
