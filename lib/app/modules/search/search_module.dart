import 'package:entregas/app/modules/search/presentation/pages/product_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SearchModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/search';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/product': (_) => ProductSearchPage(),
  };
}
