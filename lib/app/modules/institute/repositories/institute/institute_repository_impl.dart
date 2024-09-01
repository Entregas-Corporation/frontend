// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:entregas/app/core/constants/api_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/modules/institute/repositories/institute/institute_repository.dart';
import 'package:image_picker/image_picker.dart';

class InstituteRepositoryImpl implements InstituteRepository {
  final ClientService clientService;
  InstituteRepositoryImpl({
    required this.clientService,
  });

  @override
  Future<InstituteDetailDto> detail(String id) async {
    try {
      final Response response = await clientService.get(
          "${ApiConstant.detailInstitute}/$id",
          requiresAuth: true,
          contentType: 'application/json');
      return InstituteDetailDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<InstituteSaveDto> save(InstituteSaveDto model, XFile file) async {
    try {
      final formData = FormData();

      formData.fields
        ..add(MapEntry('name', model.name))
        ..add(MapEntry('description', model.description))
        ..add(MapEntry('city', model.city))
        ..add(MapEntry('longitude', model.longitude))
        ..add(MapEntry('latitude', model.latitude))
        ..add(MapEntry('whatsapp', model.whatsapp))
        ..add(MapEntry('freight_cost_km', model.freight_cost_km.toString()))
        ..add(MapEntry('user', model.user))
        ..add(MapEntry('number', model.number.toString()))
        ..add(MapEntry('complement', model.complement.toString()));

      formData.files.add(MapEntry(
        'image',
        MultipartFile.fromBytes(
          await file.readAsBytes(),
          filename: file.name,
        ),
      ));

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
