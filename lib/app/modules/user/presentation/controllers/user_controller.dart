// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/user/detail_user_dto.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/modules/user/viewmodels/user/user_viewmodel.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final UserViewmodel viewmodel;
  UserControllerBase({
    required this.viewmodel,
  });

  @computed
  List<DetailUserDto>? get userListPage => viewmodel.filterUserPageList;

  @computed
  bool get isLoading => viewmodel.isLoading;

  @action
  initValid() async {
    await viewmodel.listUserValid();
  }

  @action
  initInvalid() async {
    await viewmodel.listUserInvalid();
  }

  @action
  initSuspened() async {
    await viewmodel.listUserSuspened();
  }

  @action
  filter(String value) {
    viewmodel.filterListUserPage(value);
  }

  @action
  reactived(String id) async {
    await viewmodel.reactivateUser(id);
    await viewmodel.listUserSuspened();
  }
    
  @action
  suspend(String id) async {
    await viewmodel.suspendUser(id);
    await viewmodel.listUserValid();
  }
}
