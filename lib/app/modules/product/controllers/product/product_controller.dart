// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:entregas/app/core/dtos/product/product_save_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import 'package:entregas/app/modules/product/viewmodel/product/product_viewmodel.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductViewmodel viewmodel;
  ProductControllerBase({
    required this.viewmodel,
  });

  @computed
  bool get isLoading => viewmodel.isLoading;

  @action
  register(ProductSaveDto model, XFile file) async {
    await viewmodel.register(model, file);
  }
}
