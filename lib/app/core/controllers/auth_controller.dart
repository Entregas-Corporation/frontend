// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/viewmodels/auth_view_model.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final AuthViewModel authViewModel;
  AuthControllerBase({
    required this.authViewModel,
  });

  @computed
  String? get accessToken => authViewModel.accessToken;

  @computed
  bool get isLoading => authViewModel.isLoading;

  @action
  login() async {
    await authViewModel.login();
  }

  @action
  logout() async {
    await authViewModel.logout();
  }

  @action
  accessTokenLoad() async {
    await authViewModel.accessTokenLoad();
  }
}
