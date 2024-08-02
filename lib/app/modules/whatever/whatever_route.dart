import 'package:entregas/app/modules/whatever/presentation/pages/whatever_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

class WhateverRoute extends FlutterGetItModulePageRouter {
  const WhateverRoute({super.key});

  @override
  WidgetBuilder get view => (_) =>  WhateverPage();
}
