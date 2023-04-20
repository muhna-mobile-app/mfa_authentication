import 'package:mfa_authentication/app/data/models/login_model.dart';
import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';
import 'package:mfa_authentication/app/data/datasources/auth_datasource.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDataSource _authLocalDataSource;

  AuthRepositoryImp(this._authLocalDataSource);
  @override
  Future<AuthTokenEntity> login(LoginEntity loginEntity) async {
    try {
      final loginData = LoginModel(
        email: loginEntity.email,
        password: loginEntity.password,
      ).toJson();
      final result = await _authLocalDataSource.postLogin(loginData);
      return result.tokenEntity();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> register(
      String name, String email, String password, List roles) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
