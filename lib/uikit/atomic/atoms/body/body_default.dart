// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/uikit/tokens/sizes/scale.dart';

class BodyDefault extends StatelessWidget {
  final Widget body;
  const BodyDefault({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: Scale.sm, right: Scale.sm), child: body,);
  }
}
