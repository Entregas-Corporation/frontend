// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:entregas/app/core/dtos/institute/institute_page_dto.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/home/repositories/institute/institute_repository.dart';

part 'institute_viewmodel.g.dart';

class InstituteViewmodel = InstituteViewmodelBase with _$InstituteViewmodel;

abstract class InstituteViewmodelBase with Store {

   final InstituteRepository repository;
  final MessageService messageService;
  InstituteViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  @observable
  bool isLoading = false;

  @observable
  InstitutePageDto? instituteList;

  @action
  Future<void> listInstitutePage() async {
    try {
      isLoading = true;
      instituteList = await repository.findAllPage();
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
