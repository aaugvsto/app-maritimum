// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  bool? obscureText;
  String? hintText;
  double? paddingLeft;
  double? paddingTop;
  double? paddingRight;
  double? paddingBottom;

  TextFieldWidget({
    Key? key,
    required this.controller,
    this.obscureText,
    this.hintText,
    this.paddingLeft,
    this.paddingTop,
    this.paddingRight,
    this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        paddingLeft ?? 0,
        paddingTop ?? 0,
        paddingRight ?? 0,
        paddingBottom ?? 0,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
