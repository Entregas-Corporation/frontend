import 'package:entregas/app/core/dtos/user_save_dto.dart';

abstract interface class SocialAuthService {
  Future<UserSaveDto> login();
  Future<UserSaveDto> register();
  Future logout();
}
