import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/user/user_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppBarActionWidget extends StatefulWidget {
  const AppBarActionWidget({super.key});

  @override
  State<AppBarActionWidget> createState() => _AppBarActionWidgetState();
}

class _AppBarActionWidgetState extends State<AppBarActionWidget> {
  final routeController = Injector.get<RouteController>();

  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    userController.detail();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Scale.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButtonDefault(
            tooltipText: TextConstant.search,
            onPressed: () async {
              await routeController.routeUpdate('/search/product');
              await routeController.routeGet();
              Navigator.of(context).pushReplacementNamed(
                routeController.route.toString(),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButtonDefault(
            tooltipText: TextConstant.cart,
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          Observer(
            builder: (_) {
              if (userController.user?.photo != null) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: Scale.xs, right: Scale.xs),
                  child: Container(
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(userController.user!.photo!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              }
              return IconButtonDefault(
                icon: const Icon(Icons.person_pin_outlined),
                tooltipText: TextConstant.myAccount,
                onPressed: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
