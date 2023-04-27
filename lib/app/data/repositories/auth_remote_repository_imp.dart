import 'package:mfa_authentication/app/data/models/login_model.dart';
import 'package:mfa_authentication/app/data/models/register_model.dart';
import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/entities/register_entity.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource.dart';

class AuthRemoteRepositoryImp implements AuthRemoteRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepositoryImp(this._authRemoteDataSource);
  @override
  Future<AuthTokenEntity> login(LoginEntity loginEntity) async {
    try {
      final loginData = LoginModel(
        email: loginEntity.email,
        password: loginEntity.password,
      ).toJson();
      final result = await _authRemoteDataSource.postLogin(loginData);
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
  Future<bool> register(RegisterEntity registerEntity) async {
    try {
      final registerData = RegisterModel(
        name: registerEntity.name,
        email: registerEntity.email,
        password: registerEntity.password,
        roles: registerEntity.roles,
      ).toJson();

      final result = await _authRemoteDataSource.postRegister(registerData);
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
