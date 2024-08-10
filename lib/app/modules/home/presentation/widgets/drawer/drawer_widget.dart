import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Scale.xxs),
            child: Row(
              children: [
                IconButtonDefault(
                  icon: const Icon(Icons.menu),
                  tooltipText: TextConstant.back,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Image.asset(
                  'assets/images/ENTREGAS-LOGO-HORIZONTAL.png',
                  fit: BoxFit.cover,
                  height: Scale.lg,
                ),
              ],
            ),
          ),
          const SizedBox(
             height: Scale.xxs,
          ),
          Expanded(
            child: ContentDefault(
              child: DrawerDefault(
                home: () async {
                  await routeController.routeUpdate('/home');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                myLocation: () async {
                  await routeController.routeUpdate('/my-location');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                product: () async {
                  await routeController.routeUpdate('/search/product');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                service: () async {
                  await routeController.routeUpdate('/service');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                store: () async {
                  await routeController.routeUpdate('/store');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                myAccount: () async {
                  await routeController.routeUpdate('/my-account');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                support: () async {
                  await routeController.routeUpdate('/support');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                logout: () async {
                  await authController.logout();
                  await routeController.routeClean();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
