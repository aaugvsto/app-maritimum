import 'package:flutter/material.dart';

class AppBarAddCartaoPage extends AppBar {
  AppBarAddCartaoPage({super.key})
      : super(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ADICIONAR NOVO CARTÃO',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        );
}
