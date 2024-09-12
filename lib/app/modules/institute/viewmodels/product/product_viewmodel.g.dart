// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductViewmodel on ProductViewmodelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ProductViewmodelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  late final _$filterProductPageListAtom = Atom(
      name: 'ProductViewmodelBase.filterProductPageList', context: context);

  @override
  List<ProductDetailDto>? get filterProductPageList {
    _$filterProductPageListAtom.reportRead();
    return super.filterProductPageList;
  }

  @override
  set filterProductPageList(List<ProductDetailDto>? value) {
    _$filterProductPageListAtom.reportWrite(value, super.filterProductPageList,
        () {
      super.filterProductPageList = value;
    });
  }

  late final _$listProductByInstituteAsyncAction = AsyncAction(
      'ProductViewmodelBase.listProductByInstitute',
      context: context);

  @override
  Future<void> listProductByInstitute(String productCategoryId) {
    return _$listProductByInstituteAsyncAction
        .run(() => super.listProductByInstitute(productCategoryId));
  }

  late final _$suspendProductAsyncAction =
      AsyncAction('ProductViewmodelBase.suspendProduct', context: context);

  @override
  Future suspendProduct(String id) {
    return _$suspendProductAsyncAction.run(() => super.suspendProduct(id));
  }

  late final _$ProductViewmodelBaseActionController =
      ActionController(name: 'ProductViewmodelBase', context: context);

  @override
  dynamic filterListProducPage(String value) {
    final _$actionInfo = _$ProductViewmodelBaseActionController.startAction(
        name: 'ProductViewmodelBase.filterListProducPage');
    try {
      return super.filterListProducPage(value);
    } finally {
      _$ProductViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productList: ${productList},
filterProductPageList: ${filterProductPageList}
    ''';
  }
}
