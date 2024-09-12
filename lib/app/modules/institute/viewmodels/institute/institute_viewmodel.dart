import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:entregas/app/core/exceptions/rest_exception.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/modules/institute/repositories/institute/institute_repository.dart';

part 'institute_viewmodel.g.dart';

class InstituteViewmodel = InstituteViewmodelBase with _$InstituteViewmodel;

abstract class InstituteViewmodelBase with Store {
  final InstituteRepository repository;
  final MessageService messageService;
  InstituteViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  InstituteDetailDto? institute;

  @observable
  bool isLoading = false;

  @action
  Future<void> detail(String id) async {
    try {
      isLoading = true;
      institute = await repository.detail(id);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> register(InstituteSaveDto model, XFile file) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.save(model, file);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
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
        messageService.showMessageSuccess(TextConstant.successSaveInstitute);
      }
    }
  }

  @action
  Future<void> update(InstituteSaveDto? model, XFile? file, String id) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.update(model, file, id);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
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
        messageService.showMessageSuccess(TextConstant.successSaveInstitute);
      }
    }
  }

  @action
  suspendInstitute(String id) async {
    bool hasError = false;
    try {
      isLoading = true;
      await repository.suspend(id);
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
        messageService.showMessageSuccess(TextConstant.successSuspendInstitute);
      }
    }
  }
}
