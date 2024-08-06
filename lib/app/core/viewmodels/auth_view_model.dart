// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/local_storage_constant.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/dtos/login_user_dto.dart';
import 'package:entregas/app/core/dtos/register_user_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/repositories/user_repository.dart';
import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';
import 'package:entregas/app/core/services/local/local_store_service.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';

part 'auth_view_model.g.dart';

class AuthViewModel = AuthViewModelBase with _$AuthViewModel;

abstract class AuthViewModelBase with Store {
  final UserRepository userRepository;
  final MessageService messageService;
  final SocialAuthService socialAuthService;
  final LocalStoreService localStoreService;

  AuthViewModelBase({
    required this.userRepository,
    required this.messageService,
    required this.socialAuthService,
    required this.localStoreService,
  });

  @observable
  bool isLoading = false;

  @observable
  GoogleSignInAccount? googleCredentials;

  @observable
  String? accessToken;

  @action
  accessTokenLoad() async {
    await localStoreService.get(LocalStorageConstant.authKey).then((value) {
      if (value != null) accessToken = value;
    });
  }

  @action
  login() async {
    try {
      isLoading = true;
      googleCredentials = await socialAuthService.login();
      LoginUserDto model = LoginUserDto(email: googleCredentials!.email);
      final response = await userRepository.login(model);
      await localStoreService.put(
          LocalStorageConstant.authKey, response.data['token']);
    } on RestException catch (e) {
      if (e.response?.statusCode == 403) {
        await register();
      } else {
        await logout();
        messageService.showMessageError(e.message);
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  register() async {
    bool hasError = false;
    try {
      isLoading = true;
      RegisterUserDto model = RegisterUserDto(
          name: googleCredentials!.displayName!,
          email: googleCredentials!.email,
          image: googleCredentials?.photoUrl);
      await userRepository.register(model);
    } on RestException catch (e) {
      hasError = true;
      messageService.showMessageError(e.message);
    } finally {
      isLoading = true;
      if (!hasError) {
        messageService.showMessageSuccess(TextConstant.accountVerification);
      }
    }
  }

  @action
  logout() async {
    await localStoreService.delete(LocalStorageConstant.authKey);
    await socialAuthService.logout();
    await accessTokenLoad();
  }
}
