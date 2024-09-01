import 'package:entregas/app/modules/institute/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/app/modules/institute/presentation/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/institute/presentation/pages/create_institute_page.dart';
import 'package:entregas/app/modules/institute/presentation/pages/detail_institute_page.dart';
import 'package:entregas/app/modules/institute/presentation/pages/my_institute_by_user_page.dart';
import 'package:entregas/app/modules/institute/repositories/institute/institute_repository.dart';
import 'package:entregas/app/modules/institute/repositories/institute/institute_repository_impl.dart';
import 'package:entregas/app/modules/institute/repositories/product/product_repository.dart';
import 'package:entregas/app/modules/institute/repositories/product/product_repository_impl.dart';
import 'package:entregas/app/modules/institute/viewmodels/institute/institute_viewmodel.dart';
import 'package:entregas/app/modules/institute/viewmodels/product/product_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class InstituteModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<InstituteRepository>(
          (i) => InstituteRepositoryImpl(
            clientService: i(),
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
        ),
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
      ];

  @override
  String get moduleRouteName => '/institute';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/my-location': (_) => const MyInstituteByUserPage(),
        '/register': (_) => const CreateInstitutePage(),
        '/detail': (_) => const DetailInstitutePage(),
      };
}
