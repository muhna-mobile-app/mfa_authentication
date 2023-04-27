// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterFormStore on _RegisterFormStoreBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_RegisterFormStoreBase.isNameValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_RegisterFormStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_RegisterFormStoreBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isConfirmPasswordValidComputed;

  @override
  bool get isConfirmPasswordValid => (_$isConfirmPasswordValidComputed ??=
          Computed<bool>(() => super.isConfirmPasswordValid,
              name: '_RegisterFormStoreBase.isConfirmPasswordValid'))
      .value;
  Computed<bool>? _$isFormEmptyComputed;

  @override
  bool get isFormEmpty =>
      (_$isFormEmptyComputed ??= Computed<bool>(() => super.isFormEmpty,
              name: '_RegisterFormStoreBase.isFormEmpty'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_RegisterFormStoreBase.isFormValid'))
          .value;

  late final _$nameAtom =
      Atom(name: '_RegisterFormStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$nameStartedTypingAtom =
      Atom(name: '_RegisterFormStoreBase.nameStartedTyping', context: context);

  @override
  bool get nameStartedTyping {
    _$nameStartedTypingAtom.reportRead();
    return super.nameStartedTyping;
  }

  @override
  set nameStartedTyping(bool value) {
    _$nameStartedTypingAtom.reportWrite(value, super.nameStartedTyping, () {
      super.nameStartedTyping = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterFormStoreBase.email', context: context);

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
      Atom(name: '_RegisterFormStoreBase.emailStartedTyping', context: context);

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
      Atom(name: '_RegisterFormStoreBase.password', context: context);

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

  late final _$passwordStartedTypingAtom = Atom(
      name: '_RegisterFormStoreBase.passwordStartedTyping', context: context);

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

  late final _$confirmPasswordAtom =
      Atom(name: '_RegisterFormStoreBase.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$confirmPasswordStartedTypingAtom = Atom(
      name: '_RegisterFormStoreBase.confirmPasswordStartedTyping',
      context: context);

  @override
  bool get confirmPasswordStartedTyping {
    _$confirmPasswordStartedTypingAtom.reportRead();
    return super.confirmPasswordStartedTyping;
  }

  @override
  set confirmPasswordStartedTyping(bool value) {
    _$confirmPasswordStartedTypingAtom
        .reportWrite(value, super.confirmPasswordStartedTyping, () {
      super.confirmPasswordStartedTyping = value;
    });
  }

  late final _$_RegisterFormStoreBaseActionController =
      ActionController(name: '_RegisterFormStoreBase', context: context);

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterFormStoreBaseActionController.startAction(
        name: '_RegisterFormStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterFormStoreBaseActionController.startAction(
        name: '_RegisterFormStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_RegisterFormStoreBaseActionController.startAction(
        name: '_RegisterFormStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterFormStoreBaseActionController.startAction(
        name: '_RegisterFormStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterFormStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
nameStartedTyping: ${nameStartedTyping},
email: ${email},
emailStartedTyping: ${emailStartedTyping},
password: ${password},
passwordStartedTyping: ${passwordStartedTyping},
confirmPassword: ${confirmPassword},
confirmPasswordStartedTyping: ${confirmPasswordStartedTyping},
isNameValid: ${isNameValid},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isConfirmPasswordValid: ${isConfirmPasswordValid},
isFormEmpty: ${isFormEmpty},
isFormValid: ${isFormValid}
    ''';
  }
}
