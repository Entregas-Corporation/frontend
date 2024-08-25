import 'package:dio/dio.dart';
import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:entregas/app/core/dtos/user/login_user_dto.dart';
import 'package:entregas/app/core/dtos/user/register_user_dto.dart';

abstract interface class UserRepository {
  Future<Response> login(LoginUserDto model);
  Future<RegisterUserDto> register(RegisterUserDto model);
  Future<DetailUserDto> detail(String id);
}
