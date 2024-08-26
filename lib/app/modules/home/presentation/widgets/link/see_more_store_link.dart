// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/uikit/uikit.dart';

class SeeMoreStoreLink extends StatelessWidget {
  final void Function() onTap;
  const SeeMoreStoreLink({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return SeeMoreLink(
      text: TextConstant.seeMoreStores,
      onTap: onTap,
    );
  }
}
