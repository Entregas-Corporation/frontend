// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/app/core/dtos/product/product_page_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/search/repositories/product/product_repository.dart';

part 'product_viewmodel.g.dart';

class ProductViewmodel = ProductViewmodelBase with _$ProductViewmodel;

abstract class ProductViewmodelBase with Store {
  final ProductRepository repository;
  final MessageService messageService;
  ProductViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  @observable
  bool isLoading = false;

  @observable
  ProductPageDto? productPageList;

  @observable
  List<ProductDetailDto>? filterProductPageList;

  @action
  Future<void> listProductPage() async {
    try {
      isLoading = true;
      productPageList = await repository.findAllPage();
      filterProductPageList = productPageList?.productDto;
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  filterListProducPage(String value) {
    if (value.isNotEmpty) {
      filterProductPageList = productPageList?.productDto
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.description.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filterProductPageList = productPageList?.productDto;
    }
  }

  @action
  Future<void> listProductByProdcutCategory(String productCategoryId) async {
    try {
      isLoading = true;
      productPageList =
          await repository.findAllPageByProductCategory(productCategoryId);
      filterProductPageList = productPageList?.productDto;
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
