// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewmodel on UserViewmodelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserViewmodelBase.isLoading', context: context);

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

  late final _$userListAtom =
      Atom(name: 'UserViewmodelBase.userList', context: context);

  @override
  UserPageDto? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(UserPageDto? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$filterUserPageListAtom =
      Atom(name: 'UserViewmodelBase.filterUserPageList', context: context);

  @override
  List<DetailUserDto>? get filterUserPageList {
    _$filterUserPageListAtom.reportRead();
    return super.filterUserPageList;
  }

  @override
  set filterUserPageList(List<DetailUserDto>? value) {
    _$filterUserPageListAtom.reportWrite(value, super.filterUserPageList, () {
      super.filterUserPageList = value;
    });
  }

  late final _$listUserValidAsyncAction =
      AsyncAction('UserViewmodelBase.listUserValid', context: context);

  @override
  Future<void> listUserValid() {
    return _$listUserValidAsyncAction.run(() => super.listUserValid());
  }

  late final _$listUserInvalidAsyncAction =
      AsyncAction('UserViewmodelBase.listUserInvalid', context: context);

  @override
  Future<void> listUserInvalid() {
    return _$listUserInvalidAsyncAction.run(() => super.listUserInvalid());
  }

  late final _$listUserSuspenedAsyncAction =
      AsyncAction('UserViewmodelBase.listUserSuspened', context: context);

  @override
  Future<void> listUserSuspened() {
    return _$listUserSuspenedAsyncAction.run(() => super.listUserSuspened());
  }

  late final _$reactivateUserAsyncAction =
      AsyncAction('UserViewmodelBase.reactivateUser', context: context);

  @override
  Future reactivateUser(String id) {
    return _$reactivateUserAsyncAction.run(() => super.reactivateUser(id));
  }

  late final _$suspendUserAsyncAction =
      AsyncAction('UserViewmodelBase.suspendUser', context: context);

  @override
  Future suspendUser(String id) {
    return _$suspendUserAsyncAction.run(() => super.suspendUser(id));
  }

  late final _$UserViewmodelBaseActionController =
      ActionController(name: 'UserViewmodelBase', context: context);

  @override
  dynamic filterListUserPage(String value) {
    final _$actionInfo = _$UserViewmodelBaseActionController.startAction(
        name: 'UserViewmodelBase.filterListUserPage');
    try {
      return super.filterListUserPage(value);
    } finally {
      _$UserViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userList: ${userList},
filterUserPageList: ${filterUserPageList}
    ''';
  }
}
