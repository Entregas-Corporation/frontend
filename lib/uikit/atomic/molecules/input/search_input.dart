// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';

import 'package:entregas/uikit/atomic/atoms/input/input_default.dart';

class SearchInput extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchInput({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      hintText: TextConstant.searchPlaceholder,
      icon: const Icon(
        Icons.search,
        size: Scale.md,
      ),
      onChanged: onChanged,
    );
  }
}
