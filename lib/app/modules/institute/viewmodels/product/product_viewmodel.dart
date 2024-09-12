// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/app/core/dtos/product/product_page_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/institute/repositories/product/product_repository.dart';

part 'product_viewmodel.g.dart';

class ProductViewmodel = ProductViewmodelBase with _$ProductViewmodel;

abstract class ProductViewmodelBase with Store {
  final ProductRepository repository;
  final MessageService messageService;
  ProductViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  bool isLoading = false;

  @observable
  ProductPageDto? productList;

  @observable
  List<ProductDetailDto>? filterProductPageList;

  @action
  Future<void> listProductByInstitute(String productCategoryId) async {
    try {
      isLoading = true;
      productList = await repository.findAllPageByInstitute(productCategoryId);
      filterProductPageList = productList?.productDto;
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  filterListProducPage(String value) {
    if (value.isNotEmpty) {
      filterProductPageList = productList?.productDto
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.description.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filterProductPageList = productList?.productDto;
    }
  }

  @action
  suspendProduct(String id) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.suspend(id);
    } on RestException catch (e) {
      if (e.response?.statusCode != 400) {
        await authController.logout();
        await routeController.routeClean();
        await authController.accessTokenLoad();
        messageService.showMessageError(e.message);
      } else {
        messageService.showMessageError(e.message);
      }
    } finally {
      isLoading = false;
      if (!hasError) {
        messageService.showMessageSuccess(TextConstant.successSuspendProduct);
      }
    }
  }
}
