import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContentLoginWidget extends StatelessWidget {
  ContentLoginWidget({super.key});

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

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
          const BodyText(text: TextConstant.loginAppeal),
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
            child: Observer(builder: (_) {
              if (authController.isLoading) {
                return const ProgressButton(
                  child: SizedBox(
                    height: Scale.sm,
                    width: Scale.sm,
                    child: CircularProgressIndicator(
                      color: LightColors.background,
                    ),
                  ),
                );
              }
              return ProgressButton(
                text: TextConstant.login,
                onPressed: () async {
                  await authController.login();
                  await routeController.routeUpdate('/home');
                  if (authController.idUser != null) {
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
              );
            }),
          ),
        ]),
      ),
    );
  }
}
