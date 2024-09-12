// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:entregas/app/core/dtos/user/user_page_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/user/repositories/user/user_repository.dart';

part 'user_viewmodel.g.dart';

class UserViewmodel = UserViewmodelBase with _$UserViewmodel;

abstract class UserViewmodelBase with Store {
  final UserRepository repository;
  final MessageService messageService;
  UserViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  bool isLoading = false;

  @observable
  UserPageDto? userList;

  @observable
  List<DetailUserDto>? filterUserPageList;

  @action
  Future<void> listUserValid() async {
    try {
      isLoading = true;
      userList = await repository.findAllPageValid();
      filterUserPageList = userList?.userDto;
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> listUserInvalid() async {
    try {
      isLoading = true;
      userList = await repository.findAllPageInvalid();
      filterUserPageList = userList?.userDto;
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> listUserSuspened() async {
    try {
      isLoading = true;
      userList = await repository.findAllPageSuspened();
      filterUserPageList = userList?.userDto;
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  filterListUserPage(String value) {
    if (value.isNotEmpty) {
      filterUserPageList = userList?.userDto
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.email.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filterUserPageList = userList?.userDto;
    }
  }

  @action
  reactivateUser(String id) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.reactivateUserSuspenedById(id);
    } on RestException catch (e) {
      if (e.response?.statusCode != 400) {
        await authController.logout();
        await routeController.routeClean();
        await authController.accessTokenLoad();
        messageService.showMessageError(e.message);
      } else {
        messageService.showMessageError(e.message);
      }
    } finally {
      isLoading = false;
      if (!hasError) {
        messageService.showMessageSuccess(TextConstant.successReactivedUser);
      }
    }
  }

  @action
  suspendUser(String id) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.SuspenseUserValidById(id);
    } on RestException catch (e) {
      if (e.response?.statusCode != 400) {
        await authController.logout();
        await routeController.routeClean();
        await authController.accessTokenLoad();
        messageService.showMessageError(e.message);
      } else {
        messageService.showMessageError(e.message);
      }
    } finally {
      isLoading = false;
      if (!hasError) {
        messageService.showMessageSuccess(TextConstant.successSuspendUser);
      }
    }
  }
}
