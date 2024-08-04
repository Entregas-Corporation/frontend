import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controllerEC = TextEditingController();
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ENTREGAS-LOGO-HORIZONTAL.png',
          fit: BoxFit.cover,
          height: Scale.lg,
        ),
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Scale.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButtonDefault(
                  onPressed: () async {
                    await routeController.routeUpdate('/whatever');
                    Navigator.of(context).pushReplacementNamed('/whatever');
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButtonDefault(
                  onPressed: () async {
                    await authController.logout();
                    await routeController.routeClean();
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ],
            ),
          )
        ],
      ),
      body: BodyDefault(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchInput(text: "Pesquisar..."),
            const SizedBox(
              height: 80,
            ),
            CardDefault(
              onTap: () {},
              child: const ListTile(
                title: TitleText(text: "Title"),
                subtitle: BodyText(text: "Subtitle"),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Observer(builder: (context) {
              return BodyText(
                  text: "Access Token: ${authController.accessToken}");
            }),
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Expanded(
                    child: CancelButton(
                  text: "Back",
                  onPressed: () {},
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: ProgressButton(
                  text: "Continue",
                  onPressed: () {},
                ))
              ],
            )
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
