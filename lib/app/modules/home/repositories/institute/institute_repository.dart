import 'package:entregas/app/core/dtos/institute/institute_page_dto.dart';

abstract interface class InstituteRepository {
  Future<InstitutePageDto> findAllPage();
}
