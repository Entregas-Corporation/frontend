import 'package:entregas/app/modules/home/dto/product/product_page_dto.dart';

abstract interface class ProductRepository {
  Future<ProductPageDto> findAllPageByProductCategory(String productCategoryId);
}
