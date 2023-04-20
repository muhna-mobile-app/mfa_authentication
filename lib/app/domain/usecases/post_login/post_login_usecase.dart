import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';
import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';

class PostLoginUseCase {
  final AuthRepository _repository;
  PostLoginUseCase(this._repository);

  Future<AuthTokenEntity> post(LoginEntity loginEntity) async {
    try {
      return await _repository.login(loginEntity);
    } on Exception {
      throw UnimplementedError();
    }
  }
}
