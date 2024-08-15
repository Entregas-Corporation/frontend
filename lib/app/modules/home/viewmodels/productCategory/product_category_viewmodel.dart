// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/home/dto/productCategory/product_category_page_dto.dart';
import 'package:entregas/app/modules/home/repositories/productCategory/produc_category_repository.dart';

part 'product_category_viewmodel.g.dart';

class ProductCategoryViewmodel = ProductCategoryViewmodelBase
    with _$ProductCategoryViewmodel;

abstract class ProductCategoryViewmodelBase with Store {
  final ProducCategoryRepository repository;
  final MessageService messageService;
  ProductCategoryViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  @observable
  bool isLoading = false;

  @observable
  ProductCategoryPageDto? productCategoryList;

  @action
  Future<void> listProductPage() async {
    try {
      isLoading = true;
      productCategoryList = await repository.findAllpage();
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
