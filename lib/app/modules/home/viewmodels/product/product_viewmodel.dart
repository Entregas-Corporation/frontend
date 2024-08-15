// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/home/dto/product/product_page_dto.dart';
import 'package:entregas/app/modules/home/repositories/product/product_repository.dart';

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
  ProductPageDto? productList;

  @action
  Future<void> listProductByProdcutCategory(String productCategoryId) async {
    try {
      isLoading = true;
      productList = await repository.findAllPageByProductCategory(productCategoryId);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
