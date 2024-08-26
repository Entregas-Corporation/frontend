// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/modules/search/viewmodels/institute/institute_viewmodel.dart';

part 'institute_controller.g.dart';

class InstituteController = InstituteControllerBase with _$InstituteController;

abstract class InstituteControllerBase with Store {
  final InstituteViewmodel viewmodel;
  InstituteControllerBase({
    required this.viewmodel,
  });

  @computed
  List<InstituteDetailDto>? get instituteListPage => viewmodel.filterInstitutePageList;

  @action
  init() async {
    await viewmodel.listInstitutePage();
  }

  @action
  filter(String value) {
    viewmodel.filterListInstitutePage(value);
  }

  @action
  initInstituteByUser(String userId)async{
    await viewmodel.listInstituteByUser(userId);
  }
}
