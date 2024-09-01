// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/widgets/item/product/item_product_horizontal.dart';
import 'package:entregas/app/modules/institute/presentation/controllers/product/product_controller.dart';
import 'package:entregas/uikit/uikit.dart';

class MyListProductByInstitutesWidget extends StatefulWidget {
  final String id;
  const MyListProductByInstitutesWidget({
    super.key,
    required this.id,
  });

  @override
  State<MyListProductByInstitutesWidget> createState() =>
      _MyListProductByInstitutesWidgetState();
}

class _MyListProductByInstitutesWidgetState
    extends State<MyListProductByInstitutesWidget> {
  final productController = Injector.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.initProductByInstitute(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final productPageDto = productController.productPageDto;
      if (productPageDto == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        children: [
          const SizedBox(
            height: Scale.sm,
          ),
          SearchInput(
            onChanged: productController.filter,
          ),
          const SizedBox(
            height: Scale.xs,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FooterText(
                text: "${productPageDto.length} ${TextConstant.result}"),
          ),
          const SizedBox(
            height: Scale.sm,
          ),
          if (productPageDto.isEmpty)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Empty-pana.webp",
                ),
                BodyText(text: TextConstant.productNotFound)
              ],
            )
          else
            ListView.separated(
              itemCount: productPageDto.length,
              separatorBuilder: (_, index) => const Padding(
                padding: EdgeInsets.all(Scale.xxs),
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, index) {
                final model = productPageDto[index];
                return ItemProductHorizontal(
                  model: model,
                );
              },
            ),
        ],
      );
    });
  }
}
