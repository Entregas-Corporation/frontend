// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituteViewmodel on InstituteViewmodelBase, Store {
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

  late final _$instituteListAtom =
      Atom(name: 'InstituteViewmodelBase.instituteList', context: context);

  @override
  InstitutePageDto? get instituteList {
    _$instituteListAtom.reportRead();
    return super.instituteList;
  }

  @override
  set instituteList(InstitutePageDto? value) {
    _$instituteListAtom.reportWrite(value, super.instituteList, () {
      super.instituteList = value;
    });
  }

  late final _$filterInstitutePageListAtom = Atom(
      name: 'InstituteViewmodelBase.filterInstitutePageList', context: context);

  @override
  List<InstituteDetailDto>? get filterInstitutePageList {
    _$filterInstitutePageListAtom.reportRead();
    return super.filterInstitutePageList;
  }

  @override
  set filterInstitutePageList(List<InstituteDetailDto>? value) {
    _$filterInstitutePageListAtom
        .reportWrite(value, super.filterInstitutePageList, () {
      super.filterInstitutePageList = value;
    });
  }

  late final _$listInstitutePageAsyncAction =
      AsyncAction('InstituteViewmodelBase.listInstitutePage', context: context);

  @override
  Future<void> listInstitutePage() {
    return _$listInstitutePageAsyncAction.run(() => super.listInstitutePage());
  }

  late final _$listInstituteByUserAsyncAction = AsyncAction(
      'InstituteViewmodelBase.listInstituteByUser',
      context: context);

  @override
  Future<void> listInstituteByUser(String instituteByUserId) {
    return _$listInstituteByUserAsyncAction
        .run(() => super.listInstituteByUser(instituteByUserId));
  }

  late final _$InstituteViewmodelBaseActionController =
      ActionController(name: 'InstituteViewmodelBase', context: context);

  @override
  dynamic filterListInstitutePage(String value) {
    final _$actionInfo = _$InstituteViewmodelBaseActionController.startAction(
        name: 'InstituteViewmodelBase.filterListInstitutePage');
    try {
      return super.filterListInstitutePage(value);
    } finally {
      _$InstituteViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
instituteList: ${instituteList},
filterInstitutePageList: ${filterInstitutePageList}
    ''';
  }
}
