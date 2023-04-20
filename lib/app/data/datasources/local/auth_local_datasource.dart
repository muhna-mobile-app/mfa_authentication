import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/foundation.dart';
import 'package:mfa_authentication/app/data/datasources/auth_datasource.dart';
import 'package:mfa_authentication/app/data/models/auth_token_model.dart';

class AuthLocalDataSource extends Equatable implements AuthDataSource {
  final jsonAuthToken = {
    'token': 'ABC123',
  };

  Map<String, dynamic> jsonAuthLogin = {
    "email": "kaio@mail.com",
    "password": "123",
  };

  @override
  Future<AuthTokenModel> postLogin(Map<String, dynamic> loginData) async {
    if (mapEquals(jsonAuthLogin, loginData)) {
      return AuthTokenModel.fromJson(jsonAuthToken);
    }
    throw Exception('user not found');
  }

  @override
  Future<AuthTokenModel> postRegister(Map<String, dynamic> registerData) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [jsonAuthLogin];
}
