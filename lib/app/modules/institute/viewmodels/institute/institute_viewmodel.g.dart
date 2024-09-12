// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituteViewmodel on InstituteViewmodelBase, Store {
  late final _$instituteAtom =
      Atom(name: 'InstituteViewmodelBase.institute', context: context);

  @override
  InstituteDetailDto? get institute {
    _$instituteAtom.reportRead();
    return super.institute;
  }

  @override
  set institute(InstituteDetailDto? value) {
    _$instituteAtom.reportWrite(value, super.institute, () {
      super.institute = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'InstituteViewmodelBase.isLoading', context: context);

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

  late final _$detailAsyncAction =
      AsyncAction('InstituteViewmodelBase.detail', context: context);

  @override
  Future<void> detail(String id) {
    return _$detailAsyncAction.run(() => super.detail(id));
  }

  late final _$registerAsyncAction =
      AsyncAction('InstituteViewmodelBase.register', context: context);

  @override
  Future<void> register(InstituteSaveDto model, XFile file) {
    return _$registerAsyncAction.run(() => super.register(model, file));
  }

  late final _$updateAsyncAction =
      AsyncAction('InstituteViewmodelBase.update', context: context);

  @override
  Future<void> update(InstituteSaveDto? model, XFile? file, String id) {
    return _$updateAsyncAction.run(() => super.update(model, file, id));
  }

  late final _$suspendInstituteAsyncAction =
      AsyncAction('InstituteViewmodelBase.suspendInstitute', context: context);

  @override
  Future suspendInstitute(String id) {
    return _$suspendInstituteAsyncAction.run(() => super.suspendInstitute(id));
  }

  @override
  String toString() {
    return '''
institute: ${institute},
isLoading: ${isLoading}
    ''';
  }
}
