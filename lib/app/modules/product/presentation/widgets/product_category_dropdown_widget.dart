import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/dtos/productCategory/product_category_detail_dto.dart';
import 'package:entregas/app/modules/product/controllers/productCategory/product_category_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductCategoryDropdown extends StatelessWidget {
  ProductCategoryDropdown({super.key});
  final productCategoryController = Injector.get<ProductCategoryController>();

  @override
  Widget build(BuildContext context) {
    productCategoryController.init();
    return Observer(
      builder: (_) {
        if (productCategoryController.productListPage == null) {
          return const CircularProgressIndicator();
        }

        List<DropdownMenuItem<String>> getDropdownItems(
            List<ProductCategoryDetailModel> categories) {
          return categories.map((category) {
            return DropdownMenuItem<String>(
              value: category.id.toString(),
              child: LabelText(text: category.name),
            );
          }).toList();
        }

        return InputDropDown(
            hintText: TextConstant.selectProductCategory,
            items: getDropdownItems(
                productCategoryController.productListPage!.productCategoryDto),
            selectedValue: productCategoryController.productCatgoryItem,
            onChanged: (value) {
              productCategoryController.productCatgoryItem = value;
              print(productCategoryController.productCatgoryItem);
            });
      },
    );
  }
}
