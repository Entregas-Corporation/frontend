import 'package:entregas/app/modules/auth/presentation/pages/login_page.dart';
import 'package:entregas/app/modules/auth/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
      };
}
