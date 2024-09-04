import 'package:entregas/app/core/dtos/product/product_save_dto.dart';
import 'package:image_picker/image_picker.dart';

abstract interface class ProductRepository {
  Future<ProductSaveDto> save(ProductSaveDto model, XFile file);
}
