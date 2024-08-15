// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/detail_user_dto.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/viewmodels/user/user_view_model.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final UserViewModel viewModel;
  UserControllerBase({
    required this.viewModel,
  });

  final authController = Injector.get<AuthController>();

  @computed
  DetailUserDto? get user => viewModel.user;

  @action
  detail() async {
    await viewModel.detail(authController.idUser!);
  }
}
