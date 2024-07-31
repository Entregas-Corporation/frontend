import 'package:entregas/app/core/dtos/login_user_dto.dart';
import 'package:entregas/app/core/dtos/register_user_dto.dart';

abstract interface class UserRepository {
  Future<LoginUserDto> login(LoginUserDto model);
  Future<RegisterUserDto> register(RegisterUserDto model);
}
