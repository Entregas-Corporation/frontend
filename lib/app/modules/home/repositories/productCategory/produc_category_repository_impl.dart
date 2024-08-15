// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:entregas/app/core/constants/api_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/modules/home/dto/productCategory/product_category_page_dto.dart';

import './produc_category_repository.dart';

class ProducCategoryRepositoryImpl implements ProducCategoryRepository {
  final ClientService clientService;
  ProducCategoryRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<ProductCategoryPageDto> findAllpage() async {
    try {
      final Response response = await clientService.get(
          ApiConstant.listProductCategory,
          requiresAuth: true,
          contentType: 'application/json');
      return ProductCategoryPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
