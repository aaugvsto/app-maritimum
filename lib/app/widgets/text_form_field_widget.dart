// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final void Function()? onPressed;
  final TextInputType textInputType;

  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    required this.textInputType,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  Color? suffixColor;

  Color? prefixColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: widget.hintText,
        label: widget.labelText != null ? Text(widget.labelText!) : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.suffixIcon,
                  color: suffixColor ?? Colors.teal,
                ),
              )
            : null,
        prefixIcon: widget.prefixIcon != null
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  widget.suffixIcon,
                  color: prefixColor ?? Colors.teal,
                ),
              )
            : null,
      ),
    );
  }
}
