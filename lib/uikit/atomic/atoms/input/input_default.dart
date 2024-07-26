// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:entregas/uikit/uikit.dart';

class InputDefault extends StatelessWidget {
  final Icon? icon;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double borderRadius;
  const InputDefault({
    super.key,
    this.icon,
    required this.hintText,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onChanged,
    this.borderRadius = Scale.xs,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Style.body,
      controller: controller ?? controller,
      validator: validator ?? validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
          isDense: true,
          suffixIcon: icon ?? icon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius),
            ),
          ),
          hintText: hintText,
          ),
      onChanged: onChanged,
    );
  }
}
