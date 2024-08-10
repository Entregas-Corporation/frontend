import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/user/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SplashPagePage extends StatefulWidget {
  const SplashPagePage({super.key});

  @override
  State<SplashPagePage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPagePage> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    authController.accessTokenLoad();
    routeController.routeGet();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (authController.idUser == null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/login');
        });
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(
            context,
            routeController.route ?? '/home',
          );
        });
      }
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/ENTREGAS-LOGO-VERTICAL.png",
            height: 280,
          ),
        ),
      );
    });
  }
}
