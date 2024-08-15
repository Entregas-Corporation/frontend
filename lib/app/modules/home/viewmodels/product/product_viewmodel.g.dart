// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductViewmodel on ProductViewmodelBase, Store {
  late final _$productListAtom =
      Atom(name: 'ProductViewmodelBase.productList', context: context);

  @override
  ProductPageDto? get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ProductPageDto? value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  late final _$listProductByProdcutCategoryAsyncAction = AsyncAction(
      'ProductViewmodelBase.listProductByProdcutCategory',
      context: context);

  @override
  Future<void> listProductByProdcutCategory(String productCategoryId) {
    return _$listProductByProdcutCategoryAsyncAction
        .run(() => super.listProductByProdcutCategory(productCategoryId));
  }

  @override
  String toString() {
    return '''
productList: ${productList}
    ''';
  }
}
