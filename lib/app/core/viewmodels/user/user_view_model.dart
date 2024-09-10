// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/repositories/user/user_repository.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';

part 'user_view_model.g.dart';

class UserViewModel = UserViewModelBase with _$UserViewModel;

abstract class UserViewModelBase with Store {
  final UserRepository repository;
  final MessageService messageService;

  UserViewModelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  DetailUserDto? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> detail() async {
    try {
      isLoading = true;
      user = await repository.detail(authController.idUser!);
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    }
  }
}
