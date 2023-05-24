// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginFormStore on _LoginFormStoreBase, Store {
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginFormStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isFormEmptyComputed;

  @override
  bool get isFormEmpty =>
      (_$isFormEmptyComputed ??= Computed<bool>(() => super.isFormEmpty,
              name: '_LoginFormStoreBase.isFormEmpty'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginFormStoreBase.isFormValid'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LoginFormStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$emailStartedTypingAtom =
      Atom(name: '_LoginFormStoreBase.emailStartedTyping', context: context);

  @override
  bool get emailStartedTyping {
    _$emailStartedTypingAtom.reportRead();
    return super.emailStartedTyping;
  }

  @override
  set emailStartedTyping(bool value) {
    _$emailStartedTypingAtom.reportWrite(value, super.emailStartedTyping, () {
      super.emailStartedTyping = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginFormStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordStartedTypingAtom =
      Atom(name: '_LoginFormStoreBase.passwordStartedTyping', context: context);

  @override
  bool get passwordStartedTyping {
    _$passwordStartedTypingAtom.reportRead();
    return super.passwordStartedTyping;
  }

  @override
  set passwordStartedTyping(bool value) {
    _$passwordStartedTypingAtom.reportWrite(value, super.passwordStartedTyping,
        () {
      super.passwordStartedTyping = value;
    });
  }

  late final _$_LoginFormStoreBaseActionController =
      ActionController(name: '_LoginFormStoreBase', context: context);

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginFormStoreBaseActionController.startAction(
        name: '_LoginFormStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginFormStoreBaseActionController.startAction(
        name: '_LoginFormStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
emailStartedTyping: ${emailStartedTyping},
password: ${password},
passwordStartedTyping: ${passwordStartedTyping},
isEmailValid: ${isEmailValid},
isFormEmpty: ${isFormEmpty},
isFormValid: ${isFormValid}
    ''';
  }
}
