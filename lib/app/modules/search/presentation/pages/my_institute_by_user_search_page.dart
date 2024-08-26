import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/widgets/item/institute/item_institute_horizontal.dart';
import 'package:entregas/app/modules/search/presentation/controllers/institute/institute_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyInstituteByUserSearchPage extends StatefulWidget {
  const MyInstituteByUserSearchPage({super.key});

  @override
  State<MyInstituteByUserSearchPage> createState() =>
      _InstituteByUserSearchPageState();
}

class _InstituteByUserSearchPageState
    extends State<MyInstituteByUserSearchPage> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final instituteController = Injector.get<InstituteController>();

  @override
  void initState() {
    super.initState();
    authController.accessTokenLoad();
    instituteController.initInstituteByUser(authController.idUser!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: HeadlineText(text: TextConstant.myLocations),
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
      body: Observer(
        builder: (context) {
          final institutePageDto = instituteController.instituteListPage;
          if (institutePageDto == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return BodyDefault(
            body: Column(
              children: [
                SearchInput(
                  onChanged: instituteController.filter,
                ),
                const SizedBox(
                  height: Scale.xs,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FooterText(
                      text:
                          "${institutePageDto.length} ${TextConstant.result}"),
                ),
                const SizedBox(
                  height: Scale.sm,
                ),
                if (institutePageDto.isEmpty)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Empty-pana.webp",
                      ),
                      BodyText(text: TextConstant.locationNotFound)
                    ],
                  )
                else
                  ListView.separated(
                    itemCount: institutePageDto.length,
                    separatorBuilder: (_, index) => const Padding(
                      padding: EdgeInsets.all(Scale.xxs),
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      final model = institutePageDto[index];
                      return ItemInstituteHorizontal(model: model);
                    },
                  ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}
