import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/modules/institute/viewmodels/institute/institute_viewmodel.dart';

part 'institute_controller.g.dart';

class InstituteController = InstituteControllerBase with _$InstituteController;

abstract class InstituteControllerBase with Store {
  final InstituteViewmodel viewmodel;
  InstituteControllerBase({
    required this.viewmodel,
  });

  @computed
  bool get isLoading => viewmodel.isLoading;

  @computed
  InstituteDetailDto? get institute => viewmodel.institute;

  @action
  detail(String id) async {
    await viewmodel.detail(id);
  }

  @action
  register(InstituteSaveDto model, XFile file) async {
    await viewmodel.register(model, file);
  }

  @action
  suspend(String id) async {
    await viewmodel.suspendInstitute(id);
  }

  @action
  update(InstituteSaveDto? model, XFile? file, String id) async {
    await viewmodel.update(model, file, id);
  }
}
