import 'package:entregas/app/modules/home/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [];

  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {'/': (context) => const HomeRoute()};
}
