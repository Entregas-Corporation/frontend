import 'package:entregas/app/modules/auth/auth_route.dart';
import 'package:entregas/app/modules/auth/presentation/pages/splash_page_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SplashPagePage(),
        '/login': (context) => const AuthRoute(),
      };
}
