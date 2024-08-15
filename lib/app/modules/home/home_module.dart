import 'package:entregas/app/modules/home/home_route.dart';
import 'package:entregas/app/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/home/presentation/controllers/product_category/product_category_controller.dart';
import 'package:entregas/app/modules/home/repositories/product/product_repository.dart';
import 'package:entregas/app/modules/home/repositories/product/product_repository_impl.dart';
import 'package:entregas/app/modules/home/repositories/productCategory/produc_category_repository.dart';
import 'package:entregas/app/modules/home/repositories/productCategory/produc_category_repository_impl.dart';
import 'package:entregas/app/modules/home/viewmodels/product/product_viewmodel.dart';
import 'package:entregas/app/modules/home/viewmodels/productCategory/product_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProducCategoryRepository>(
          (i) => ProducCategoryRepositoryImpl(
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
            service: i(),
          ),
        ),
        Bind.lazySingleton(
            (i) => ProductViewmodel(repository: i(), messageService: i())),
        Bind.lazySingleton(
          (i) => ProductController(
            viewmodel: i(),
          ),
        )
      ];

  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {'/': (context) => const HomeRoute()};
}
