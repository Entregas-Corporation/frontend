// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  Computed<List<ProductDetailDto>?>? _$productPageDtoComputed;

  @override
  List<ProductDetailDto>? get productPageDto => (_$productPageDtoComputed ??=
          Computed<List<ProductDetailDto>?>(() => super.productPageDto,
              name: 'ProductControllerBase.productPageDto'))
      .value;

  late final _$initProductByInstituteAsyncAction = AsyncAction(
      'ProductControllerBase.initProductByInstitute',
      context: context);

  @override
  Future initProductByInstitute(String instituteId) {
    return _$initProductByInstituteAsyncAction
        .run(() => super.initProductByInstitute(instituteId));
  }

  late final _$suspendAsyncAction =
      AsyncAction('ProductControllerBase.suspend', context: context);

  @override
  Future suspend(String id) {
    return _$suspendAsyncAction.run(() => super.suspend(id));
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
productPageDto: ${productPageDto}
    ''';
  }
}
