import 'package:entregas/app/core/dtos/institute/institute_detail_dto.dart';
import 'package:entregas/app/core/dtos/institute/institute_save_dto.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class InstituteRepository {
  Future<InstituteDetailDto> detail(String id);
  Future<InstituteSaveDto> save(InstituteSaveDto model, XFile file);
  Future<InstituteDetailDto> suspend(String id);
  Future<InstituteSaveDto> update(InstituteSaveDto? model, XFile? file, String id);
}
