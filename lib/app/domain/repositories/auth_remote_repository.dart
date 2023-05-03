import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/entities/register_entity.dart';

abstract class AuthRemoteRepository {
  Future<AuthTokenEntity> login(LoginEntity loginEntity);
  Future<bool> register(RegisterEntity registerEntity);
}
