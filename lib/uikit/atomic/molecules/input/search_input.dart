// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atoms/input/input_default.dart';

class SearchInput extends StatelessWidget {
  final String text;
  final void Function(String)? onChanged;
  const SearchInput({
    super.key,
    required this.text,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      hintText: text,
      icon: const Icon(
        Icons.search,
        size: Scale.md,
      ),
      onChanged: onChanged,
    );
  }
}
