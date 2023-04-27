import 'package:mfa_authentication/app/domain/entities/register_entity.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';

class RegisterUserUseCase {
  final AuthRemoteRepository _authRemoteRepository;

  RegisterUserUseCase(this._authRemoteRepository);

  Future<bool> register(RegisterEntity registerEntity) async {
    try {
      return await _authRemoteRepository.register(registerEntity);
    } catch (e) {
      throw Exception(e);
    }
  }
}
