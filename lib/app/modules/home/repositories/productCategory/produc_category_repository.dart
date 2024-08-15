import 'package:entregas/app/modules/home/dto/productCategory/product_category_page_dto.dart';

abstract interface class ProducCategoryRepository {
  Future<ProductCategoryPageDto> findAllpage();
}
