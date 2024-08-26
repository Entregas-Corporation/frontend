// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/uikit/uikit.dart';

class ItemProductVertical extends StatelessWidget {
  const ItemProductVertical({
    super.key,
    required this.model,
  });
  final ProductDetailDto model;

  @override
  Widget build(BuildContext context) {
    return CardDefault(
      borderRadius: Scale.xs,
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(model.image), fit: BoxFit.contain)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Scale.xs,
              Scale.xs,
              Scale.xs,
              Scale.xxs,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelText(
                  text: model.name,
                  overflow: true,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BodyText(
                      text:
                          "R\$ ${model.price.toStringAsFixed(2).replaceAll('.', ',')}",
                      overflow: true,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: Scale.md,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
