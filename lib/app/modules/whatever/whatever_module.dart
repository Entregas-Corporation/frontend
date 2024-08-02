import 'package:entregas/app/modules/whatever/whatever_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhateverModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/whatever';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (_) => const WhateverRoute()
  };
}
