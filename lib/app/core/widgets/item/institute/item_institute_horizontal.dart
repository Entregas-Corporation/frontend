// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';

import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';

class ItemInstituteHorizontal extends StatelessWidget {
  final InstituteDetailDto model;
  const ItemInstituteHorizontal({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return CardDefault(
      borderRadius: Scale.sm,
      child: Container(
        padding: const EdgeInsets.all(Scale.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              model.image,
              fit: BoxFit.contain,
              width: 80,
            ),
            const SizedBox(
              width: Scale.xs,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: Scale.xs),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(text: model.name),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    LabelText(
                      text: model.description,
                      maxLines: 1,
                      overflow: true,
                    ),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    FooterText(text: model.city),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
