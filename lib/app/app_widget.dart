import 'package:entregas/app/core/controllers/auth_controller.dart';
import 'package:entregas/app/core/services/auth/social/google_auth_service_impl.dart';
import 'package:entregas/app/core/services/auth/social/social_auth_service.dart';
import 'package:entregas/app/modules/auth/auth_module.dart';
import 'package:entregas/app/modules/home/home_module.dart';

import 'package:entregas/l10n/l10n.dart';
import 'package:entregas/uikit/visual_identity/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindingsBuilder: () {
        return [
          Bind.singleton<SocialAuthService>(
            (i) => GoogleAuthServiceImpl(),
          ),
          Bind.singleton((i) => AuthController(service: i()))
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
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
        );
      },
    );
  }
}
