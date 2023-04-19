class LoginController {
  bool isEmailValid(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }
}
