import 'package:entregas/app/core/dtos/productCategory/product_category_page_dto.dart';
import 'package:entregas/app/core/dtos/productCategory/product_category_save_dto.dart';

abstract interface class ProducCategoryRepository {
  Future<ProductCategoryPageDto> findAllpage();
  Future<ProductCategorySaveDto> save(ProductCategorySaveDto model);
}
