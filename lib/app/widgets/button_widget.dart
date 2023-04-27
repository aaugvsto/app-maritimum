// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final String label;
  final IconData icon;
  final dynamic onPressed;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingRight;
  final double? paddingBottom;

  const ButtonWidget({
    Key? key,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
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
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(backgroundColor ?? Colors.teal),
          iconColor: MaterialStateProperty.all(iconColor ?? Colors.white),
        ),
      ),
    );
  }
}
