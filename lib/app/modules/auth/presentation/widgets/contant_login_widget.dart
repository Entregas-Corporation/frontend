import 'package:entregas/app/core/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ContentLoginWidget extends StatelessWidget {
  ContentLoginWidget({super.key});

  final authController = Injector.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(Scale.xl),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset(
            "assets/images/ENTREGAS-LOGO-VERTICAL.png",
            height: 200,
          ),
          const BodyText(text: "Que tal fazer um pedido?"),
          const SizedBox(
            height: Scale.xs,
          ),
          Image.network(
            "assets/images/delivery_login.gif",
            height: 180,
          ),
          const SizedBox(
            height: Scale.sm,
          ),
          SizedBox(
            width: double.infinity,
            child: ProgressButton(
              text: "Fazer Login",
              onPressed: () {
                authController.login();
              },
            ),
          ),
        ]),
      ),
    );
  }
}
