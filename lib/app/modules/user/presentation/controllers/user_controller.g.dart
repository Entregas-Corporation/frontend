// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  Computed<List<DetailUserDto>?>? _$userListPageComputed;

  @override
  List<DetailUserDto>? get userListPage => (_$userListPageComputed ??=
          Computed<List<DetailUserDto>?>(() => super.userListPage,
              name: 'UserControllerBase.userListPage'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'UserControllerBase.isLoading'))
          .value;

  late final _$initValidAsyncAction =
      AsyncAction('UserControllerBase.initValid', context: context);

  @override
  Future initValid() {
    return _$initValidAsyncAction.run(() => super.initValid());
  }

  late final _$initInvalidAsyncAction =
      AsyncAction('UserControllerBase.initInvalid', context: context);

  @override
  Future initInvalid() {
    return _$initInvalidAsyncAction.run(() => super.initInvalid());
  }

  late final _$initSuspenedAsyncAction =
      AsyncAction('UserControllerBase.initSuspened', context: context);

  @override
  Future initSuspened() {
    return _$initSuspenedAsyncAction.run(() => super.initSuspened());
  }

  late final _$reactivedAsyncAction =
      AsyncAction('UserControllerBase.reactived', context: context);

  @override
  Future reactived(String id) {
    return _$reactivedAsyncAction.run(() => super.reactived(id));
  }

  late final _$suspendAsyncAction =
      AsyncAction('UserControllerBase.suspend', context: context);

  @override
  Future suspend(String id) {
    return _$suspendAsyncAction.run(() => super.suspend(id));
  }

  late final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase', context: context);

  @override
  dynamic filter(String value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.filter');
    try {
      return super.filter(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userListPage: ${userListPage},
isLoading: ${isLoading}
    ''';
  }
}
