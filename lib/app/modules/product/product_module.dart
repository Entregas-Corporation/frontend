import 'package:entregas/app/modules/product/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/product/controllers/productCategory/product_category_controller.dart';
import 'package:entregas/app/modules/product/presentation/pages/create_product_page.dart';
import 'package:entregas/app/modules/product/repositories/product/product_repository.dart';
import 'package:entregas/app/modules/product/repositories/product/product_repository_impl.dart';
import 'package:entregas/app/modules/product/repositories/productCategory/product_category_repository.dart';
import 'package:entregas/app/modules/product/repositories/productCategory/product_category_repository_impl.dart';
import 'package:entregas/app/modules/product/viewmodel/product/product_viewmodel.dart';
import 'package:entregas/app/modules/product/viewmodel/productCategory/product_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ProductModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProductCategoryRepository>(
          (i) => ProductCategoryRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductCategoryViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductCategoryController(
            viewmodel: i(),
          ),
        ),
        
        Bind.lazySingleton<ProductRepository>(
          (i) => ProductRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductController(
            viewmodel: i(),
          ),
        )
      ];

  @override
  String get moduleRouteName => '/product';

  @override
  Map<String, WidgetBuilder> get pages =>
      {'/register': (_) => const CreateProductPage()};
}
