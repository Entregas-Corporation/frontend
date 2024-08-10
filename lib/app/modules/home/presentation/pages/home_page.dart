import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/user/user_controller.dart';
import 'package:entregas/app/modules/home/presentation/widgets/appBarAction/app_bar_action_widget.dart';
import 'package:entregas/app/modules/home/presentation/widgets/card/initial_happy_card.dart';
import 'package:entregas/app/modules/home/presentation/widgets/drawer/drawer_widget.dart';
import 'package:entregas/app/modules/home/presentation/widgets/link/see_more_store_link.dart';
import 'package:entregas/app/modules/home/presentation/widgets/listView/product_by_category_list_view.dart';
import 'package:entregas/app/modules/home/presentation/widgets/listView/store_list_view.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controllerEC = TextEditingController();

  final authController = Injector.get<AuthController>();

  final routeController = Injector.get<RouteController>();

  final userController = Injector.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/ENTREGAS-LOGO-HORIZONTAL.png',
          fit: BoxFit.cover,
          height: Scale.lg,
        ),
        actions: const [
          AppBarActionWidget(),
        ],
      ),
      body: const BodyDefault(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InitialHappyCard(),
            SizedBox(
              height: Scale.md,
            ),
            StoreListView(),
            SizedBox(
              height: Scale.xs,
            ),
            SeeMoreStoreLink(),
            SizedBox(
              height: Scale.md,
            ),
            ProductByCategoryListView()
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
