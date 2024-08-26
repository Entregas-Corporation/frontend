import 'package:entregas/app/modules/search/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/app/modules/search/presentation/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/search/presentation/pages/my_institute_by_user_search_page.dart';
import 'package:entregas/app/modules/search/presentation/pages/institute_search_page.dart';
import 'package:entregas/app/modules/search/presentation/pages/product_by_product_category_search_page.dart';
import 'package:entregas/app/modules/search/presentation/pages/product_search_page.dart';
import 'package:entregas/app/modules/search/repositories/instuitute/institute_repository.dart';
import 'package:entregas/app/modules/search/repositories/instuitute/institute_repository_impl.dart';
import 'package:entregas/app/modules/search/repositories/product/product_repository.dart';
import 'package:entregas/app/modules/search/repositories/product/product_repository_impl.dart';
import 'package:entregas/app/modules/search/viewmodels/institute/institute_viewmodel.dart';
import 'package:entregas/app/modules/search/viewmodels/product/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SearchModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProductRepository>(
          (i) => ProductRepositoryImpl(
            service: i(),
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
        ),
        Bind.lazySingleton<InstituteRepository>(
          (i) => InstituteRepositoryImpl(
            service: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => InstituteViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => InstituteController(
            viewmodel: i(),
          ),
        )
      ];

  @override
  String get moduleRouteName => '/search';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/product': (_) => const ProductSearchPage(),
        '/product/by/product-category': (_) =>
            ProductByProductCategorySearchPage(),
        '/institute': (_) => const InstituteSearchPage(),
        '/institute/by/user': (_) => const MyInstituteByUserSearchPage(),
      };
}
