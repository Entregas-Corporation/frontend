// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/app/core/dtos/product/product_page_dto.dart';
import 'package:entregas/app/modules/home/viewmodels/product/product_viewmodel.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductViewmodel viewmodel;
  ProductControllerBase({
    required this.viewmodel,
  });

  @computed
  ProductPageDto? get productPageDto => viewmodel.productList;

  @computed
  ProductDetailDto? get product => viewmodel.product;

  @computed
  bool get isLoading => viewmodel.isLoading;

  @action
  detail(String id) async {
    await viewmodel.detail(id);
  }

  @action
  initProductByProductCategory(String productCategoryId) async {
    await viewmodel.listProductByProdcutCategory(productCategoryId);
  }
}
