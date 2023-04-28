import 'package:mfa_authentication/app/data/datasources/local/auth_local_datasource.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_local_repository.dart';

import '../../domain/entities/auth_token_entity.dart';

class AuthLocalRepositoryImp implements AuthLocalRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepositoryImp(this._authLocalDataSource);

  @override
  Future<String?> getAuthToken() async {
    try {
      return await _authLocalDataSource.get();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveAuthToken(AuthTokenEntity authTokenEntity) async {
    final token = authTokenEntity.authToken;
    try {
      await _authLocalDataSource.save(token!);
    } catch (e) {
      rethrow;
    }
  }
}
