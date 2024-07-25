// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/tokens/typhography/style.dart';
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atoms/atom.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final bool overflow;
  const HeadlineText({
    super.key,
    required this.text,
    this.overflow = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextDefault(
      text: text,
      textStyle: Style.headline,
      overflow: overflow,
    );
  }
}
