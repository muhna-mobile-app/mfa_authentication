import '../../models/auth_token_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> postLogin(Map<String, dynamic> loginData);
  Future<AuthTokenModel> postRegister(Map<String, dynamic> registerData);
}
