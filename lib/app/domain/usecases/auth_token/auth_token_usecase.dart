import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_local_repository.dart';

class AuthTokenUseCase {
  final AuthLocalRepository _authLocalRepository;

  AuthTokenUseCase(this._authLocalRepository);

  Future<String?> getToken() async {
    try {
      return await _authLocalRepository.getAuthToken();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveToken(AuthTokenEntity authTokenEntity) async {
    try {
      await _authLocalRepository.saveAuthToken(authTokenEntity);
    } catch (e) {
      rethrow;
    }
  }
}
