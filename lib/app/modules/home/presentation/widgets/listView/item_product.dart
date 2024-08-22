// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:entregas/app/modules/home/dto/product/product_detail_dto.dart';
import 'package:entregas/app/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:entregas/uikit/uikit.dart';

class ItemProduct extends StatefulWidget {
  final String id;
  const ItemProduct({
    super.key,
    required this.id,
  });

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  final productController = Injector.get<ProductController>();
  @override
  void initState() {
    super.initState();
    productController.initProductByProductCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final productPageDto = productController.productPageDto;

      if (productPageDto == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Scale.xs,
          mainAxisSpacing: Scale.xs,
          mainAxisExtent: 153,
        ),
        itemCount: productPageDto.productDto.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final ProductDetailDto model = productPageDto.productDto[index];
          return CardDefault(
            borderRadius: Scale.xs,
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(model.image),
                          fit: BoxFit.contain)),
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
                        text: "${model.name}${model.name}${model.name}",
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
        },
      );
    });
  }

  ItemProduct copyWith({
    String? id,
  }) {
    return ItemProduct(
      id: id ?? this.widget.id,
    );
  }
}
