import 'package:entregas/app/core/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Injector.get<AuthController>();

  @override
  void initState() {
    super.initState();
    controller.accessTokenLoad();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (controller.accessToken == null) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(
          "assets/images/ENTREGAS-LOGO-VERTICAL.png",
          height: 300,
        ),
      ),
    );
  }
}
