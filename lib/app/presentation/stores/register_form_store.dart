import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/presentation/extensions/ext_string.dart';

part 'register_form_store.g.dart';

// ignore: library_private_types_in_public_api
class RegisterFormStore = _RegisterFormStoreBase with _$RegisterFormStore;

abstract class _RegisterFormStoreBase with Store {
  @observable
  String name = '';
  @observable
  bool nameStartedTyping = false;

  @observable
  String email = '';
  @observable
  bool emailStartedTyping = false;

  @observable
  String password = '';
  @observable
  bool passwordStartedTyping = false;

  @observable
  String confirmPassword = '';
  @observable
  bool confirmPasswordStartedTyping = false;

  @action
  setName(String value) {
    name = value;
    nameStartedTyping = true;
  }

  @action
  setEmail(String value) {
    email = value;
    emailStartedTyping = true;
  }

  @action
  setPassword(String value) {
    password = value;
    passwordStartedTyping = true;
  }

  @action
  setConfirmPassword(String value) {
    confirmPassword = value;
    confirmPasswordStartedTyping = true;
  }

  @computed
  bool get isNameValid {
    return name.length >= 3;
  }

  @computed
  bool get isEmailValid {
    return email.isValidEmail;
  }

  @computed
  bool get isPasswordValid {
    return password.length >= 6;
  }

  @computed
  bool get isConfirmPasswordValid {
    return confirmPassword == password && isPasswordValid;
  }

  String? validateName() {
    return !nameStartedTyping || isNameValid ? null : 'Preencha um nome válido';
  }

  String? validateEmail() {
    return !emailStartedTyping || isEmailValid
        ? null
        : 'Preencha com um email válido';
  }

  String? validatePassword() {
    return !passwordStartedTyping || isPasswordValid
        ? null
        : 'A senha deve conter pelo menos 6 caracteres';
  }

  String? validateConfirmPassword() {
    return !confirmPasswordStartedTyping || isConfirmPasswordValid
        ? null
        : 'Senhas não coincidem';
  }

  @computed
  bool get isFormEmpty {
    return name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty;
  }

  @computed
  bool get isFormValid {
    return isNameValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid &&
        !isFormEmpty;
  }
}
