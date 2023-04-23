import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';

class LogInUserUseCase {
  final AuthRemoteRepository _repository;
  LogInUserUseCase(this._repository);

  Future<AuthTokenEntity> logIn(LoginEntity loginEntity) async {
    try {
      return await _repository.login(loginEntity);
    } catch (e) {
      throw Exception(e);
    }
  }
}
