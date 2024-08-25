import 'package:entregas/app/core/dtos/productCategory/product_category_page_dto.dart';

abstract interface class ProducCategoryRepository {
  Future<ProductCategoryPageDto> findAllpage();
}
