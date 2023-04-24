import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';

abstract class AuthLocalRepository {
  Future<String?> getAuthToken();
  Future<void> saveAuthToken(AuthTokenEntity authTokenEntity);
}
