// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function()? onPressed;
  final TextInputType? textInputType;
  final Color? borderColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? hintTextColor;
  final void Function(String)? onChanged;
  final bool? marginBottom;
  final void Function(String)? onEditingComplete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? maxLength;
  final Function()? onTap;
  final dynamic Function(PointerDownEvent)? onTapOutside;
  final bool? readOnly;

  const TextFormFieldWidget({
    Key? key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.onPressed,
    this.textInputType,
    this.borderColor,
    this.prefixIconColor,
    this.hintTextColor,
    this.suffixIconColor,
    this.onChanged,
    this.marginBottom = false,
    this.onEditingComplete,
    this.validator,
    this.controller,
    this.maxLength,
    this.onTap,
    this.readOnly,
    this.onTapOutside,
  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginBottom! ? 22 : 0),
      child: TextFormField(
        maxLength: widget.maxLength,
        validator: widget.validator,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.textInputType ?? TextInputType.name,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.black,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.black,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.black,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.red,
            ),
          ),
          hintText: widget.hintText,
          label: widget.labelText != null
              ? Text(
                  widget.labelText!,
                  style: TextStyle(color: widget.hintTextColor),
                )
              : null,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
