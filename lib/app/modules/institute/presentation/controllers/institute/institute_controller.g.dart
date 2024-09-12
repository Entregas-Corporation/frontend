// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituteController on InstituteControllerBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'InstituteControllerBase.isLoading'))
          .value;
  Computed<InstituteDetailDto?>? _$instituteComputed;

  @override
  InstituteDetailDto? get institute => (_$instituteComputed ??=
          Computed<InstituteDetailDto?>(() => super.institute,
              name: 'InstituteControllerBase.institute'))
      .value;

  late final _$detailAsyncAction =
      AsyncAction('InstituteControllerBase.detail', context: context);

  @override
  Future detail(String id) {
    return _$detailAsyncAction.run(() => super.detail(id));
  }

  late final _$registerAsyncAction =
      AsyncAction('InstituteControllerBase.register', context: context);

  @override
  Future register(InstituteSaveDto model, XFile file) {
    return _$registerAsyncAction.run(() => super.register(model, file));
  }

  late final _$suspendAsyncAction =
      AsyncAction('InstituteControllerBase.suspend', context: context);

  @override
  Future suspend(String id) {
    return _$suspendAsyncAction.run(() => super.suspend(id));
  }

  late final _$updateAsyncAction =
      AsyncAction('InstituteControllerBase.update', context: context);

  @override
  Future update(InstituteSaveDto? model, XFile? file, String id) {
    return _$updateAsyncAction.run(() => super.update(model, file, id));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
institute: ${institute}
    ''';
  }
}
