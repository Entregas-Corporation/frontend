// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  Computed<DetailUserDto?>? _$userComputed;

  @override
  DetailUserDto? get user =>
      (_$userComputed ??= Computed<DetailUserDto?>(() => super.user,
              name: 'UserControllerBase.user'))
          .value;

  late final _$detailAsyncAction =
      AsyncAction('UserControllerBase.detail', context: context);

  @override
  Future detail() {
    return _$detailAsyncAction.run(() => super.detail());
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
