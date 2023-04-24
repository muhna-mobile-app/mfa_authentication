import 'package:mfa_authentication/app/domain/entities/login_repository.dart';
import 'package:mfa_authentication/app/domain/usecases/auth_token/auth_token_usecase.dart';
import 'package:mfa_authentication/app/domain/usecases/login_user/login_user_usecase.dart';

class LoginController {
  final LogInUserUseCase _logInUserUseCase;
  final AuthTokenUseCase _authTokenUseCase;
  late LoginEntity loginEntity;
  LoginController(this._logInUserUseCase, this._authTokenUseCase);

  Future<String?> logInUser(String email, String password) async {
    loginEntity = LoginEntity(
      email: email,
      password: password,
    );

    try {
      final authTokenEntity = await _logInUserUseCase.logIn(loginEntity);
      await _authTokenUseCase.saveToken(authTokenEntity);
      return await _authTokenUseCase.getToken();
    } catch (e) {
      throw Exception(e);
    }
  }
}
