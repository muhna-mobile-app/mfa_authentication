import '../models/auth_token_model.dart';

abstract class AuthDataSource {
  Future<AuthTokenModel> loginUser(Map<String, dynamic> loginData);
  Future<AuthTokenModel> registerUser(Map<String, dynamic> registerData);
}
