// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final SocialAuthService service;
  final MessageService messageService;
  AuthControllerBase({
    required this.service,
    required this.messageService,
  });

  @action
  login() async {
    try {
      await service.login();
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    }
  }

  @action
  logout() {
    service.logout();
  }
}
