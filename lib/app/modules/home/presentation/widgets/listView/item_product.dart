import 'package:entregas/app/modules/home/dto/product/product_detail_dto.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:entregas/app/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemProduct extends StatefulWidget {
  final String id;
  
  const ItemProduct({
    super.key,
    required this.id,
  });

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  late final ProductController productController;

  @override
  void initState() {
    super.initState();
    productController = Injector.get<ProductController>();
    // Inicializa os produtos quando o widget for criado
    productController.initProductByProductCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final productPageDto = productController.productPageDto;

      if (productPageDto == null) {
        // Mostrar um widget de carregamento ou vazio
        return Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Scale.xs,
          mainAxisSpacing: Scale.xs,
          mainAxisExtent: 150,
        ),
        itemCount: productPageDto.productDto.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final ProductDetailDto model = productPageDto.productDto[index];
          return CardDefault(
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(Scale.md),
                      topRight: Radius.circular(Scale.md),
                    ),
                  ),
                  child: BodyText(text: model.name),
                ),
                Padding(
                  padding: EdgeInsets.all(Scale.xxs),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
