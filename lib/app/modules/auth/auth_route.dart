import 'package:entregas/app/modules/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AuthRoute extends FlutterGetItModulePageRouter {
  const AuthRoute({super.key});

  @override
  WidgetBuilder get view => (_) => const LoginPage();
}
