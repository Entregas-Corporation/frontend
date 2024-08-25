import 'package:entregas/app/core/dtos/product/product_page_dto.dart';

abstract interface class ProductRepository {
  Future<ProductPageDto> findAllPageByProductCategory(String productCategoryId);
}
