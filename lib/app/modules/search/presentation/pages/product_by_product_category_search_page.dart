// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/widgets/item/product/item_product_horizontal.dart';
import 'package:entregas/app/modules/search/presentation/controllers/product/product_controller.dart';
import 'package:entregas/uikit/uikit.dart';

class ProductByProductCategorySearchPage extends StatelessWidget {
  ProductByProductCategorySearchPage({
    super.key,
  });

  final authController = Injector.get<AuthController>();

  final routeController = Injector.get<RouteController>();

  final productController = Injector.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    productController
        .initProductByProductCategory(arguments['productCategoryId']);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: HeadlineText(text: arguments['productCategoryName']),
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
              if (productPageDto.isEmpty)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Empty-pana.webp",
                    ),
                    BodyText(text: TextConstant.productNotFound)
                  ],
                )
              else
                ListView.separated(
                  itemCount: productPageDto.length,
                  separatorBuilder: (_, index) => const Padding(
                    padding: EdgeInsets.all(Scale.xxs),
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final model = productPageDto[index];
                    return ItemProductHorizontal(
                      model: model,
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/home/product/detail',
                          arguments: {
                            'productId': model.id,
                          },
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        );
      }),
    );
  }
}
