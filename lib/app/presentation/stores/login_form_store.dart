import '../extensions/ext_string.dart';
import 'package:common_dependencies/common_dependencies.dart';
part 'login_form_store.g.dart';

class LoginFormStore = _LoginFormStoreBase with _$LoginFormStore;

abstract class _LoginFormStoreBase with Store {
  @observable
  String email = '';
  @observable
  bool emailStartedTyping = false;

  @observable
  String password = '';
  @observable
  bool passwordStartedTyping = false;

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

  @computed
  bool get isEmailValid {
    return email.isValidEmail;
  }

  String? validateEmail() {
    return !emailStartedTyping || isEmailValid
        ? null
        : 'Preencha com um email válido';
  }

  @computed
  bool get isFormEmpty {
    return email.isEmpty || password.isEmpty;
  }

  @computed
  bool get isFormValid {
    return isEmailValid && !isFormEmpty;
  }

  void clearLoginForm() {
    setEmail('');
    setPassword('');
  }
}
