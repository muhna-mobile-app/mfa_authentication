import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';

abstract class AuthRemoteRepository {
  Future<AuthTokenEntity> login(LoginEntity loginEntity);
  Future<bool> logout();
  Future<bool> register(String name, String email, String password, List roles);
}
