// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'ProductControllerBase.isLoading'))
          .value;

  late final _$registerAsyncAction =
      AsyncAction('ProductControllerBase.register', context: context);

  @override
  Future register(ProductSaveDto model, XFile file) {
    return _$registerAsyncAction.run(() => super.register(model, file));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
