import 'package:entregas/app/modules/home/presentation/controllers/product_category/product_category_controller.dart';
import 'package:entregas/app/modules/home/presentation/widgets/listView/item_product.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductByCategoryListView extends StatefulWidget {
  const ProductByCategoryListView({super.key});

  @override
  State<ProductByCategoryListView> createState() =>
      _ProductByCategoryListViewState();
}

class _ProductByCategoryListViewState extends State<ProductByCategoryListView> {
  final productCategoryController = Injector.get<ProductCategoryController>();

  @override
  void initState() {
    super.initState();
    productCategoryController.init();

  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ListView.separated(
        itemCount: productCategoryController.productListPage != null
            ? productCategoryController
                .productListPage!.productCategoryDto.length
            : 0,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, index) => const Padding(
          padding: EdgeInsets.all(Scale.xs),
          child: Divider(color: LightColors.tertiary),
        ),
        itemBuilder: (context, index) {
          final categoryModel = productCategoryController
              .productListPage!.productCategoryDto[index];

          return Column(
            children: [
              CardDefault(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TitleText(text: categoryModel.name),
                          ),
                          InkWell(
                            onTap: () {},
                            child:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ],
                      ),
                      const DividerDefault(),
                      ItemProduct(id: categoryModel.id)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
