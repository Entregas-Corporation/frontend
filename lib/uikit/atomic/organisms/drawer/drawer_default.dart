// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:flutter/material.dart';

import 'package:entregas/uikit/uikit.dart';

class DrawerDefault extends StatelessWidget {
  final void Function() home;
  final void Function() myLocation;
  final void Function() product;
  final void Function() service;
  final void Function() store;
  final void Function() myAccount;
  final void Function() support;
  final void Function() logout;
  const DrawerDefault({
    super.key,
    required this.home,
    required this.myLocation,
    required this.product,
    required this.service,
    required this.store,
    required this.myAccount,
    required this.support,
    required this.logout,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            MenuItem(
              text: TextConstant.home,
              icon: const Icon(Icons.home_outlined),
              onPressed: home,
            ),
            MenuItem(
              text: TextConstant.myLocations,
              icon: const Icon(Icons.fmd_good_outlined),
              onPressed: myLocation,
            ),
            MenuItem(
              text: TextConstant.myAccount,
              icon: const Icon(Icons.person_pin_outlined),
              onPressed: myAccount,
            ),
            const DividerDefault(),
            MenuItem(
              text: TextConstant.products,
              icon: const Icon(Icons.sell_outlined),
              onPressed: product,
            ),
            MenuItem(
              text: TextConstant.services,
              icon: const Icon(Icons.work_history_outlined),
              onPressed: service,
            ),
            MenuItem(
              text: TextConstant.stores,
              icon: const Icon(Icons.store_mall_directory_outlined),
              onPressed: product,
            ),
            MenuItem(
              text: TextConstant.support,
              icon: const Icon(Icons.contact_support_outlined),
              onPressed: support,
            ),
          ],
        ),
        Column(
          children: [
            const DividerDefault(),
            MenuItem(
              text: TextConstant.logout,
              icon: const Icon(Icons.logout),
              onPressed: logout,
            ),
            const SizedBox(
               height: Scale.xxs,
            ),
          ],
        ),
      ],
    );
  }
}
