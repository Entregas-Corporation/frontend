// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/uikit/tokens/token.dart';

class IconButtonDefault extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  const IconButtonDefault({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(LightColors.tertiary),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Scale.xs),
          ),
        ),
      ),
    );
  }
}
