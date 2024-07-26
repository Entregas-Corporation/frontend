// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atoms/atom.dart';
import 'package:entregas/uikit/tokens/token.dart';

class ProgressButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ProgressButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
        text: text,
        backgroundColor: LightColors.secondary,
        foregroundColor: LightColors.onSecondary,
        onPressed: onPressed,
        );
  }
}
