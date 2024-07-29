// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  late final _$googleAccountAtom =
      Atom(name: 'AuthControllerBase.googleAccount', context: context);

  @override
  GoogleSignInAccount? get googleAccount {
    _$googleAccountAtom.reportRead();
    return super.googleAccount;
  }

  @override
  set googleAccount(GoogleSignInAccount? value) {
    _$googleAccountAtom.reportWrite(value, super.googleAccount, () {
      super.googleAccount = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthControllerBase.login', context: context);

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthControllerBase.logout', context: context);

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
googleAccount: ${googleAccount}
    ''';
  }
}
