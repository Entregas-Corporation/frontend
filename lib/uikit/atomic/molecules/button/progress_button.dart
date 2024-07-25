import 'package:entregas/uikit/atomic/atoms/atom.dart';
import 'package:entregas/uikit/tokens/token.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final String text;
  const ProgressButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
        text: text,
        backgroundColor: LightColors.secondary,
        foregroundColor: LightColors.primary);
  }
}
