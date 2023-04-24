import 'package:flutter_test/flutter_test.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource_imp.dart';
import 'package:mfa_authentication/app/data/models/auth_token_model.dart';

void main() {
  var loginData = {"email": "mail@mail.com", "password": "123"};
  test('It should return an AuthTokenModel', () async {
    AuthRemoteDataSourceImp authRemoteDataSource = AuthRemoteDataSourceImp();

    final response = await authRemoteDataSource.postLogin(loginData);

    expect(response, isA<AuthTokenModel>());
  });

  test('It should get a token String from the response', () async {
    AuthRemoteDataSourceImp authRemoteDataSource = AuthRemoteDataSourceImp();

    final response = await authRemoteDataSource.postLogin(loginData);
    final authToken = response.token;
    expect(authToken, isA<String>());
  });
}
