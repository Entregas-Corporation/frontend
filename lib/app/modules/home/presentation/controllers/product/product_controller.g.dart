// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  Computed<ProductPageDto?>? _$productPageDtoComputed;

  @override
  ProductPageDto? get productPageDto => (_$productPageDtoComputed ??=
          Computed<ProductPageDto?>(() => super.productPageDto,
              name: 'ProductControllerBase.productPageDto'))
      .value;

  late final _$initProductByProductCategoryAsyncAction = AsyncAction(
      'ProductControllerBase.initProductByProductCategory',
      context: context);

  @override
  Future initProductByProductCategory(String productCategoryId) {
    return _$initProductByProductCategoryAsyncAction
        .run(() => super.initProductByProductCategory(productCategoryId));
  }

  @override
  String toString() {
    return '''
productPageDto: ${productPageDto}
    ''';
  }
}
