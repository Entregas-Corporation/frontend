import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhateverPage extends StatelessWidget {
  WhateverPage({super.key});
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUALQUER'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            await routeController.routeUpdate('/home');
            Navigator.popAndPushNamed(context, "/home");
          },
        ),
      ),
      body: Container(),
    );
  }
}
