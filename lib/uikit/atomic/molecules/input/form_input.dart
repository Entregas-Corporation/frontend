// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:entregas/uikit/atomic/atoms/input/input_default.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String text;
  const FormInput({
    super.key,
    required this.controller,
    this.maxLines = 1,
    this.inputFormatters,
    this.validator,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      maxLines: maxLines,
      controller: controller,
      inputFormatters: inputFormatters,
      validator: validator,
      hintText: text,
    );
  }
}
