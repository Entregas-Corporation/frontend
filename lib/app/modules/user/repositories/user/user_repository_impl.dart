// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:entregas/app/core/constants/api_constant.dart';
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:entregas/app/core/dtos/user/user_page_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/client/client_service.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService service;
  UserRepositoryImpl({
    required this.service,
  });

  @override
  Future<UserPageDto> findAllPageInvalid() async {
    try {
      final Response response = await service.get(
        ApiConstant.listUserInvalid,
        requiresAuth: true,
        contentType: 'application/json',
      );
      return UserPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<UserPageDto> findAllPageSuspened() async {
    try {
      final Response response = await service.get(
        ApiConstant.listUserSuspened,
        requiresAuth: true,
        contentType: 'application/json',
      );
      return UserPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<UserPageDto> findAllPageValid() async {
    try {
      final Response response = await service.get(
        ApiConstant.listUserValid,
        requiresAuth: true,
        contentType: 'application/json',
      );
      return UserPageDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }

  @override
  Future<DetailUserDto> reactivateUserSuspenedById(String id) async{
    try {
      final Response response = await service.get(
          "${ApiConstant.reactivateUserSuspened}/$id",
          requiresAuth: true,
          contentType: 'application/json');
      return DetailUserDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
  
  @override
  Future<DetailUserDto> SuspenseUserValidById(String id) async{
    try {
      final Response response = await service.get(
          "${ApiConstant.suspendUserValid}/$id",
          requiresAuth: true,
          contentType: 'application/json');
      return DetailUserDto.fromMap(response.data);
    } on DioException catch (e) {
      throw RestException(TextConstant.serverError, e.hashCode, e.response);
    }
  }
}
