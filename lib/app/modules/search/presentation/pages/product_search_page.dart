import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/modules/search/presentation/controllers/product/product_controller.dart';
import 'package:entregas/app/modules/search/presentation/widget/item_product.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductSearchPage extends StatefulWidget {
  ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final productController = Injector.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: kToolbarHeight,
          title: const HeadlineText(text: TextConstant.searchProduct),
          leading: IconButtonDefault(
            icon: const Icon(Icons.arrow_back),
            tooltipText: TextConstant.back,
            onPressed: () async {
              await routeController.routeUpdate('/home');
              await routeController.routeGet();
              Navigator.of(context)
                  .pushReplacementNamed(routeController.route.toString());
            },
          ),
        ),
        body: Observer(builder: (context) {
          final productPageDto = productController.productListPage;
          if (productPageDto == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return BodyDefault(
            body: Column(
              children: [
                SearchInput(
                  onChanged: productController.filter,
                ),
                const SizedBox(
                  height: Scale.xs,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FooterText(
                      text: "${productPageDto.length} ${TextConstant.result}"),
                ),
                const SizedBox(
                  height: Scale.sm,
                ),
                ListView.separated(
                    itemCount: productPageDto.length,
                    separatorBuilder: (_, index) => const Padding(
                          padding: EdgeInsets.all(Scale.xxs),
                        ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final model = productPageDto[index];

                      return ItemProduct(model: model);
                    })
              ],
            ),
          );
        }));
  }
}
