// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardDefault extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  const CardDefault({
    super.key,
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: child,
      ),
    );
  }
}
