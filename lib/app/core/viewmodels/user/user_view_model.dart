// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/dtos/detail_user_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/repositories/user_repository.dart';
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

  @observable
  DetailUserDto? user;

  @observable
  bool isLoading = false;

  @action
  Future<void> detail(String id) async {
    try {
      isLoading = true;
      user = await repository.detail(id);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    }
  }
}
