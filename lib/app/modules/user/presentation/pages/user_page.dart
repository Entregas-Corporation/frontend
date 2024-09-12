import 'package:entregas/app/core/constants/text_constant.dart';
import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/modules/user/presentation/widgets/listview/user_invalid_listview.dart';
import 'package:entregas/app/modules/user/presentation/widgets/listview/user_suspened_listview.dart';
import 'package:entregas/app/modules/user/presentation/widgets/listview/user_valid_listview.dart';
import 'package:entregas/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: HeadlineText(text: TextConstant.users),
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
        body: SizedBox(
          height: MediaQuery.of(context).size.height - 120,
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                dividerColor: LightColors.tertiary,
                tabs: [
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Scale.xs),
                      child: Center(
                        child: LabelText(text: TextConstant.valid),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Scale.xs),
                      child: Center(
                        child: LabelText(text: TextConstant.invalid),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      padding: const EdgeInsets.all(Scale.xs),
                      child: Center(
                        child: LabelText(text: TextConstant.suspended),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const[
                    UserValidListview(),
                    UserInvalidListview(),
                    UserSuspenedListview(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
