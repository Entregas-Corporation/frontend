import 'package:entregas/app/modules/home/dto/institute/institute_page_dto.dart';

abstract interface class InstituteRepository {
  Future<InstitutePageDto> findAllPage();
}
