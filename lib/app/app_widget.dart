import 'package:entregas/app/core/controllers/auth/auth_controller.dart';
import 'package:entregas/app/core/controllers/route/route_controller.dart';
import 'package:entregas/app/core/controllers/user/user_controller.dart';
import 'package:entregas/app/core/repositories/user_repository.dart';
import 'package:entregas/app/core/repositories/user_repository_impl.dart';
import 'package:entregas/app/core/services/auth/social/google_auth_service_impl.dart';
import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/core/services/client/client_service_impl.dart';
import 'package:entregas/app/core/services/local/local_store_service.dart';
import 'package:entregas/app/core/services/local/local_store_service_impl.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/core/services/messages/message_service_impl.dart';
import 'package:entregas/app/core/viewmodels/auth/auth_view_model.dart';
import 'package:entregas/app/core/viewmodels/user/user_view_model.dart';
import 'package:entregas/app/modules/auth/auth_module.dart';
import 'package:entregas/app/modules/home/home_module.dart';
import 'package:entregas/app/modules/search/search_module.dart';

import 'package:entregas/uikit/visual_identity/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return FlutterGetIt(
      bindingsBuilder: () {
        return [
          Bind.singleton<LocalStoreService>(
            (i) => LocalStoreServiceImpl(),
          ),
          Bind.singleton<ClientService>(
            (i) => ClientServiceImpl(i()),
          ),
          Bind.singleton<SocialAuthService>(
            (i) => GoogleAuthServiceImpl(),
          ),
          Bind.singleton<GlobalKey<NavigatorState>>(
            (i) => navigatorKey,
          ),
          Bind.singleton<MessageService>(
            (i) => MessageServiceImpl(
              navigatorKey: i(),
            ),
          ),
          Bind.singleton<UserRepository>(
            (i) => UserRepositoryImpl(
              clientService: i(),
            ),
          ),
          Bind.singleton(
            (i) => AuthViewModel(
              userRepository: i(),
              messageService: i(),
              socialAuthService: i(),
              localStoreService: i(),
            ),
          ),
          Bind.singleton(
            (i) => AuthController(authViewModel: i()),
          ),
          Bind.singleton(
            (i) => RouteController(
              localStoreService: i(),
            ),
          ),
          Bind.singleton(
            (i) => UserViewModel(
              repository: i(),
              messageService: i(),
            ),
          ),
          Bind.singleton(
            (i) => UserController(
              viewModel: i(),
            ),
          )
        ];
      },
      modules: [
        HomeModule(),
        AuthModule(),
        SearchModule(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: 'Entregas',
          debugShowCheckedModeBanner: false,
          theme: ligthTheme,
          navigatorKey: navigatorKey,
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
        );
      },
    );
  }
}
