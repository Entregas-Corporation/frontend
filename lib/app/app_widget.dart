import 'package:entregas/app/core/controllers/auth_controller.dart';
import 'package:entregas/app/core/services/auth/social/google_auth_service_impl.dart';
import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';
import 'package:entregas/app/core/services/client/client_service.dart';
import 'package:entregas/app/core/services/client/client_service_impl.dart';
import 'package:entregas/app/core/services/messages/message_service.dart';
import 'package:entregas/app/core/services/messages/message_service_impl.dart';
import 'package:entregas/app/modules/auth/auth_module.dart';
import 'package:entregas/app/modules/home/home_module.dart';

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
          Bind.singleton<ClientService>(
            (i) => ClientServiceImpl(),
          ),
          Bind.singleton<SocialAuthService>(
            (i) => GoogleAuthServiceImpl(
              clientService: i(),
            ),
          ),
          Bind.singleton<GlobalKey<NavigatorState>>(
            (i) => navigatorKey,
          ),
          Bind.singleton<MessageService>(
            (i) => MessageServiceImpl(
              navigatorKey: i(),
            ),
          ),
          Bind.singleton(
            (i) => AuthController(
              service: i(),
              messageService: i(),
            ),
          )
        ];
      },
      modules: [
        HomeModule(),
        AuthModule(),
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
