// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/modules/search/viewmodels/product/product_viewmodel.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductViewmodel viewmodel;
  ProductControllerBase({
    required this.viewmodel,
  });

  @computed
  List<ProductDetailDto>? get productListPage =>
      viewmodel.filterProductPageList;

  @action
  init() async {
    await viewmodel.listProductPage();
  }

  @action
  filter(String value) {
    viewmodel.filterListProducPage(value);
  }

  @action
  initProductByProductCategory(String productCategoryId) async {
    await viewmodel.listProductByProdcutCategory(productCategoryId);
  }
}
