import 'package:entregas/app/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRoute extends FlutterGetItModulePageRouter {
  const HomeRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
/*         Bind.lazySingleton(
          (i) => Controller(
          ),
        ),
        Bind.lazySingleton(
          (i) => Viewmodel(
          ),
        ), */
      ];


  @override
  WidgetBuilder get view => (_) => const HomePage();

}
