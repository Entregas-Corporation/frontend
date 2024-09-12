import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/widgets/item/user/item_user_horizontal.dart';
import 'package:entregas/app/modules/user/presentation/controllers/user_controller.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserValidListview extends StatefulWidget {
  const UserValidListview({super.key});

  @override
  State<UserValidListview> createState() => _UserValidListviewState();
}

class _UserValidListviewState extends State<UserValidListview> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final userController = Injector.get<UserController>();

  @override
  void initState() {
    super.initState();
    authController.accessTokenLoad();
    userController.initValid();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final userPageDto = userController.userListPage;
      if (userPageDto == null) {
        return const Center(child: CircularProgressIndicator());
      }

      if (userController.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final filteredUsers =
          userPageDto.where((user) => user.role != 'ADMIN').toList();

      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: Scale.sm,
            ),
            SearchInput(
              onChanged: userController.filter,
            ),
            const SizedBox(
              height: Scale.xs,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FooterText(
                  text: "${filteredUsers.length} ${TextConstant.result}"),
            ),
            const SizedBox(
              height: Scale.sm,
            ),
            if (userPageDto.isEmpty)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/Empty-pana.webp",
                  ),
                  BodyText(text: TextConstant.userNotFound)
                ],
              )
            else
              ListView.separated(
                itemCount: userPageDto.length,
                separatorBuilder: (_, index) => const Padding(
                  padding: EdgeInsets.all(Scale.xxs),
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final model = userPageDto[index];
                  if (userPageDto[index].role != "ADMIN") {
                    return ItemUserHorizontal(
                      model: model,
                      onPressed: () {
                        userController.suspend(model.id);
                      },
                      icon: const Icon(
                        Icons.delete_sweep_outlined,
                        color: LightColors.error,
                      ),
                      tooltipText: TextConstant.suspend,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
          ],
        ),
      );
    });
  }
}
