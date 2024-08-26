// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:entregas/app/core/dtos/institute/institute_page_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/search/repositories/instuitute/institute_repository.dart';

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

  @observable
  List<InstituteDetailDto>? filterInstitutePageList;

  @action
  Future<void> listInstitutePage() async {
    try {
      isLoading = true;
      instituteList = await repository.findAllPage();
      filterInstitutePageList = instituteList?.instituteDto;
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  filterListInstitutePage(String value) {
    if (value.isNotEmpty) {
      filterInstitutePageList = instituteList?.instituteDto
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.description.toLowerCase().contains(value.toLowerCase()) ||
              element.city.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      filterInstitutePageList = instituteList?.instituteDto;
    }
  }

  @action
  Future<void> listInstituteByUser(String instituteByUserId) async {
    try {
      isLoading = true;
      instituteList =
          await repository.findAllPageByUser(instituteByUserId);
      filterInstitutePageList = instituteList?.instituteDto;
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
