import 'package:entregas/app/core/dtos/product/product_detail_dto.dart';
import 'package:entregas/app/core/dtos/product/product_page_dto.dart';

abstract interface class ProductRepository {
  Future<ProductPageDto> findAllPageByInstitute(String id);
  Future<ProductDetailDto> suspend(String id);
}
