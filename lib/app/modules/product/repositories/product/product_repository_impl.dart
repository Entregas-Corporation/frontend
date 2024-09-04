// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:entregas/app/core/constants/api_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/dtos/product/product_save_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:image_picker/image_picker.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ClientService clientService;
  ProductRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<ProductSaveDto> save(ProductSaveDto model, XFile file) async {
    try {
      final formData = FormData();

      formData.fields
        ..add(MapEntry('name', model.name))
        ..add(MapEntry('description', model.description))
        ..add(MapEntry('price', model.price.toString()))
        ..add(MapEntry('quantity', model.quantity.toString()))
        ..add(MapEntry('institute', model.institute))
        ..add(MapEntry('category', model.category))
        ..add(MapEntry('actived', model.actived.toString()))
        ..add(MapEntry('valid', model.valid.toString()));

      formData.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(
            await file.readAsBytes(),
            filename: file.name,
          )));

      return await clientService.post(ApiConstant.registerInstitute, formData,
          requiresAuth: true, contentType: 'multipart/form-data');
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw RestException(TextConstant.fieldError, e.hashCode, e.response);
      }
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
