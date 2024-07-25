import 'package:entregas/uikit/atomic/atoms/atom.dart';
import 'package:entregas/uikit/tokens/token.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final String text;
  const CancelButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
        text: text,
        backgroundColor: LightColors.tertiary,
        foregroundColor: LightColors.onPrimary);
  }
}