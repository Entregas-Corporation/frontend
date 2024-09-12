import 'package:entregas/app/modules/user/presentation/controllers/user_controller.dart';
import 'package:entregas/app/modules/user/presentation/pages/user_page.dart';
import 'package:entregas/app/modules/user/repositories/user/user_repository.dart';
import 'package:entregas/app/modules/user/repositories/user/user_repository_impl.dart';
import 'package:entregas/app/modules/user/viewmodels/user/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class UserModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>(
          (i) => UserRepositoryImpl(
            service: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UserViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UserController(
            viewmodel: i(),
          ),
        ),
      ];

  @override
  String get moduleRouteName => '/user';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (_) => const UserPage(),
      };
}
