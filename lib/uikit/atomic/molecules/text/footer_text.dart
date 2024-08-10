// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

class FooterText extends StatelessWidget {
  final String text;
  final bool overflow;
  final Color? color;
  const FooterText({
    super.key,
    required this.text,
    this.overflow = false,
    this.color,
  });

   @override
   Widget build(BuildContext context) {
       return TextDefault(
      text: text,
      textStyle: Style.footer(color: color),
      overflow: overflow,
    );
  }
}
