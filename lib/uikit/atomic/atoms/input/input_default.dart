// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:entregas/uikit/uikit.dart';

class InputDefault extends StatelessWidget {
  final Icon? icon;
  final String hintText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final double borderRadius;
  const InputDefault({
    super.key,
    this.icon,
    required this.hintText,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    this.controller,
    this.onChanged,
    this.borderRadius = Scale.xxs,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: Style.body,
      controller: controller ?? controller,
      validator: validator ?? validator,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: Scale.xs, vertical: Scale.xxs),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: Scale.xs, left: Scale.xxs),
          child: icon ?? icon,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderFoucus),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderDefault),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderDefault),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderDefault),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderDefault),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
          borderSide: const BorderSide(width: Scale.borderDefault),
        ),
        hintText: hintText,
      ),
      onChanged: onChanged,
    );
  }
}
