/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/local_storage_contant.dart';
import 'package:entregas/app/core/dtos/user_auth_dto.dart';
import 'package:entregas/app/core/services/local/local_store_service.dart';

class AuthViewModel {
  final LocalStoreService localStoreService;
  AuthViewModel({
    required this.localStoreService,
  });


  Future init() async {
    await localStoreService.get(LocalStorageContant.authKey);
  }
}
 */