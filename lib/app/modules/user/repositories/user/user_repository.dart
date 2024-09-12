import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:entregas/app/core/dtos/user/user_page_dto.dart';

abstract interface class UserRepository {
  Future<UserPageDto> findAllPageValid();
  Future<UserPageDto> findAllPageInvalid();
  Future<UserPageDto> findAllPageSuspened();
  Future<DetailUserDto> reactivateUserSuspenedById(String id);
  Future<DetailUserDto> SuspenseUserValidById(String id);
}
