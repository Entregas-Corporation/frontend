import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class ProductSearchPage extends StatelessWidget {
  ProductSearchPage({super.key});
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

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
      body: BodyDefault(
          body: Column(
        children: [
          const SearchInput(),
          const SizedBox(
            height: 8,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: LabelText(text: "10 ${TextConstant.result}"),
          ),
          const SizedBox(
            height: 12,
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) => const CardDefault(
              child: ListTile(
                title: TitleText(text: "Title"),
                subtitle: BodyText(text: "Subtitle"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
