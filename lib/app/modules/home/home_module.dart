import 'package:entregas/app/modules/home/home_route.dart';
import 'package:entregas/app/modules/home/repositories/repository.dart';
import 'package:entregas/app/modules/home/repositories/repository_impl.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/core/services/client/client_service_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<Repository>(
          (i) => RepositoryImpl()
        ),
        Bind.lazySingleton<ClientService>(
          (i) => ClientServiceImpl(),
        ),
      ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {'/': (context) => const HomeRoute()};
}
