import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/modules/home/presentation/widgets/card/select_menu_item.dart';
import 'package:entregas/uikit/atomic/atoms/card/card_default.dart';
import 'package:entregas/uikit/tokens/sizes/scale.dart';
import 'package:flutter/material.dart';

class GroupSelectMenuCard extends StatelessWidget {
  const GroupSelectMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 320,
      child: CardDefault(
      
      
          child: Padding(
            padding: const EdgeInsets.all(Scale.xs),
            child: Column(
                  children: [
            Row(
              children: [
                Expanded(
                  child: SelectMenuItem(
                      icon: Icons.person_pin_outlined,
                      text: TextConstant.users,
                      onTap: () {}),
                ),
                const SizedBox(
                  width: Scale.xs,
                ),
                Expanded(
                  child: SelectMenuItem(
                      icon: Icons.person_pin_outlined,
                      text: TextConstant.users,
                      onTap: () {}),
                ),
              ],
            ),
            const SizedBox(
              height: Scale.xs,
            ),
            Row(
              children: [
                Expanded(
                  child: SelectMenuItem(
                      icon: Icons.person_pin_outlined,
                      text: TextConstant.users,
                      onTap: () {}),
                ),
                const SizedBox(
                  width: Scale.xs,
                ),
                Expanded(
                  child: SelectMenuItem(
                      icon: Icons.person_pin_outlined,
                      text: TextConstant.users,
                      onTap: () {}),
                ),
              ],
            ),
                  ],
                ),
          )),
    );
  }
}
