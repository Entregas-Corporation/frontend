// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/atomic/atoms/body/content/content_default.dart';
import 'package:entregas/uikit/atomic/atoms/body/divider/divider_default.dart';
import 'package:entregas/uikit/atomic/atoms/body/footer/footer_default.dart';
import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';


class BodyDefault extends StatelessWidget {
  final Widget body;
  const BodyDefault({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ContentDefault(
        child: Column(
          children: [
            body,
            const SizedBox(
               height: Scale.xs,
            ),
            const DividerDefault(),
            const FooterDefault(),
          ],
        ),
      ),
    );
  }
}
