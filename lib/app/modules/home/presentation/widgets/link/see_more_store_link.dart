import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

class SeeMoreStoreLink extends StatefulWidget {
  const SeeMoreStoreLink({super.key});

  @override
  State<SeeMoreStoreLink> createState() => _SeeMoreStoreLinkState();
}

class _SeeMoreStoreLinkState extends State<SeeMoreStoreLink> {
  @override
  Widget build(BuildContext context) {
    return SeeMoreLink(
      text: TextConstant.seeMoreStores,
      onTap: () {},
    );
  }
}
