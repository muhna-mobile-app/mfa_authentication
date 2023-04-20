import 'package:mfa_authentication/app/data/datasources/auth_datasource.dart';
import 'package:mfa_authentication/app/data/models/auth_token_model.dart';

class AuthLocalDataSource implements AuthDataSource {
  final jsonAuthToken = {
    'token': 'ABC123',
  };

  final jsonAuthLogin = {
    "email": "kaio@mail.com",
    "password": "123",
  };

  @override
  Future<AuthTokenModel> loginUser(Map<String, dynamic> loginData) async {
    if (jsonAuthLogin != loginData) {
      throw Exception();
    }
    return AuthTokenModel.fromJson(jsonAuthToken);
  }

  @override
  Future<AuthTokenModel> registerUser(Map<String, dynamic> registerData) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
}
