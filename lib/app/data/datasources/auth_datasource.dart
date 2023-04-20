import '../models/auth_token_model.dart';

abstract class AuthDataSource {
  Future<AuthTokenModel> postLogin(Map<String, dynamic> loginData);
  Future<AuthTokenModel> postRegister(Map<String, dynamic> registerData);
}
