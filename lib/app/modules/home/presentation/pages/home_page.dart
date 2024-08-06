import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/modules/home/presentation/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter_getit/flutter_getit.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: Scale.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButtonDefault(
                  tooltipText: TextConstant.search,
                  onPressed: () async {
                    await routeController.routeUpdate('/search/product');
                    await routeController.routeGet();
                    Navigator.of(context)
                        .pushReplacementNamed(routeController.route.toString());
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButtonDefault(
                  tooltipText: TextConstant.cart,
                  onPressed: () {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: "${TextConstant.hello}, Lázaro Alexandre!"),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                )),
                Image.network(
                  'assets/images/Welcome.gif',
                  height: 140,
                )
              ],
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: 12,
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIP.oxjFL1dNYLfGdXzB6r_4yAHaEK?rs=1&pid=ImgDetMain",
                    ),
                    backgroundColor: LightColors.background,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FooterText(text: TextConstant.seeMoreStores),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 12,
                )
              ],
            ),

            /* Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 FooterText(text: "Ver mais lojas"),

                 Icon(Icons.arrow_circle_right_outlined, size: 12,)
              ],
            ), */
            const SizedBox(
              height: 12,
            ),
            ListView.separated(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(
                  color: LightColors.tertiary,
                ),
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  CardDefault(
                    backgroundColor: LightColors.error,
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleText(
                                text: "Categoria",
                                color: LightColors.onSecondary,
                              ),
                              Icon(Icons.keyboard_arrow_right_rounded)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 4,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => const CardDefault(
                        child: SizedBox(
                      height: 100,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget());
  }
}
