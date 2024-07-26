// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atomic.dart';

class ButtonDefault extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  const ButtonDefault({
    super.key,
    this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: WidgetStatePropertyAll(foregroundColor),
      ),
      child: BodyText(text: text),
    );
  }
}
