// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atoms/atom.dart';
import 'package:entregas/uikit/tokens/typhography/style.dart';

class HeadlineText extends StatelessWidget {
  final int? maxLines;
  final String text;
  final bool overflow;
  final Color? color;
  const HeadlineText({
    super.key,
    this.maxLines,
    required this.text,
    this.overflow = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextDefault(
      text: text,
      textStyle: Style.headline(color: color),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
