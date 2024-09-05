import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/app/core/widgets/item/product/item_product_vertical.dart';
import 'package:entregas/app/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/home/presentation/controllers/product_category/product_category_controller.dart';
import 'package:entregas/uikit/uikit.dart';

class ProductByCategoryListView extends StatefulWidget {
  const ProductByCategoryListView({super.key});

  @override
  State<ProductByCategoryListView> createState() =>
      _ProductByCategoryListViewState();
}

class _ProductByCategoryListViewState extends State<ProductByCategoryListView> {
  final productCategoryController = Injector.get<ProductCategoryController>();
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final productController = Injector.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productCategoryController.init();
  }

  Future<void> _loadProducts(String categoryId) async {
    await productController.initProductByProductCategory(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final categories =
          productCategoryController.productListPage?.productCategoryDto ?? [];

      return ListView.separated(
        itemCount: categories.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, index) => const Padding(
          padding: EdgeInsets.all(Scale.xs),
          child: DividerDefault(),
        ),
        itemBuilder: (context, index) {
          final categoryModel = categories[index];

          _loadProducts(categoryModel.id);

          return FutureBuilder(
            future: productController
                .initProductByProductCategory(categoryModel.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CardDefault(
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
                            const CircularProgressIndicator(),
                          ],
                        ),
                        const DividerDefault(),
                      ],
                    ),
                  ),
                );
              }

              if (snapshot.hasError) {
                return CardDefault(
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
                            const Icon(Icons.error),
                          ],
                        ),
                        const DividerDefault(),
                      ],
                    ),
                  ),
                );
              }

              final productPageDto = productController.productPageDto;

              return CardDefault(
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
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed(
                                '/search/product/by/product-category',
                                arguments: {
                                  'productCategoryId': categoryModel.id,
                                  'productCategoryName': categoryModel.name
                                },
                              );
                            },
                            child:
                                const Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ],
                      ),
                      const DividerDefault(),
                      productPageDto == null ||
                              productPageDto.productDto.isEmpty
                          ? const Center(
                              child: Text('Productos não disponíveis'))
                          : SizedBox(
                              height: 153,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: Scale.xs,
                                  mainAxisSpacing: Scale.xs,
                                  mainAxisExtent: 153,
                                ),
                                itemCount: productPageDto.productDto.length > 4
                                    ? 4
                                    : productPageDto.productDto.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final ProductDetailDto model =
                                      productPageDto.productDto[index];
                                  return ItemProductVertical(
                                    model: model,
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                        '/home/product/detail',
                                        arguments: {
                                          'productId': model.id,
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
