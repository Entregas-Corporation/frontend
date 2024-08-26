// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  Computed<List<ProductDetailDto>?>? _$productListPageComputed;

  @override
  List<ProductDetailDto>? get productListPage => (_$productListPageComputed ??=
          Computed<List<ProductDetailDto>?>(() => super.productListPage,
              name: 'ProductControllerBase.productListPage'))
      .value;

  late final _$initAsyncAction =
      AsyncAction('ProductControllerBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$initProductByProductCategoryAsyncAction = AsyncAction(
      'ProductControllerBase.initProductByProductCategory',
      context: context);

  @override
  Future initProductByProductCategory(String productCategoryId) {
    return _$initProductByProductCategoryAsyncAction
        .run(() => super.initProductByProductCategory(productCategoryId));
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  dynamic filter(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.filter');
    try {
      return super.filter(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productListPage: ${productListPage}
    ''';
  }
}
