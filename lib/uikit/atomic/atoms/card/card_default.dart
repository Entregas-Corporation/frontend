// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:entregas/uikit/tokens/token.dart';

class CardDefault extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final Color? backgroundColor;
  const CardDefault({
    super.key,
    this.onTap,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Scale.sm),
      onTap: onTap,
      child: Card(
        color: backgroundColor,
        child: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(
                color: backgroundColor != null ? LightColors.onSecondary : null,
              ),
            ),
            child: child),
      ),
    );
  }
}
