import 'package:entregas/app/core/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhateverPage extends StatelessWidget {
  WhateverPage({super.key});
  final controller = Injector.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QUALQUER'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popAndPushNamed(context, "/home");
          },
        ),
      ),
      body: Container(),
    );
  }
}
