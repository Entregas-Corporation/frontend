// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final SocialAuthService service;
  AuthControllerBase({
    required this.service,
  });

  @observable
  GoogleSignInAccount? googleAccount;

  @action
  login() async {
    googleAccount = await service.login();
  }

  @action
  logout() async {
    googleAccount = await service.logout();
  }
}
