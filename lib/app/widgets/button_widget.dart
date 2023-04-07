// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Color backgroundColor;
  Color iconColor;
  Color textColor;
  String label;
  IconData icon;
  dynamic onPressed;
  double? paddingLeft;
  double? paddingTop;
  double? paddingRight;
  double? paddingBottom;

  ButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.iconColor,
    required this.textColor,
    required this.label,
    required this.icon,
    required this.onPressed,
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
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          iconColor: MaterialStateProperty.all(iconColor),
        ),
      ),
    );
  }
}
