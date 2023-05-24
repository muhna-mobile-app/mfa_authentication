import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/domain/entities/register_entity.dart';
import 'package:mfa_authentication/app/domain/usecases/auth_token/auth_token_usecase.dart';
import 'package:mfa_authentication/app/domain/usecases/login_user/login_user_usecase.dart';
import 'package:mfa_authentication/app/domain/usecases/register_user/register_user_usecase.dart';

import '../../domain/entities/login_repository.dart';
part 'auth_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthStore = _AuthStoreBase with _$AuthStore;

enum AuthStatus { initial, authenticated, unauthenticated, loading }

abstract class _AuthStoreBase with Store {
  @observable
  AuthStatus status = AuthStatus.initial;

  @observable
  String? errorMessage;

  @computed
  bool get isAuthenticated => status == AuthStatus.authenticated;

  @action
  Future<void> login(String email, String password) async {
    try {
      status = AuthStatus.loading;
      final loginEntity = LoginEntity(
        email: email,
        password: password,
      );
      final logInUserUseCase = GetIt.I.get<LogInUserUseCase>();
      final authTokenUseCase = GetIt.I.get<AuthTokenUseCase>();

      final authTokenEntity = await logInUserUseCase.logIn(loginEntity);
      await authTokenUseCase.saveToken(authTokenEntity);

      status = AuthStatus.authenticated;
    } catch (error) {
      errorMessage = error.toString();
      status = AuthStatus.unauthenticated;
    }
  }

  @action
  Future<void> register(String name, String email, String password) async {
    try {
      status = AuthStatus.loading;
      final registerUserUseCase = GetIt.I.get<RegisterUserUseCase>();

      final registerEntity = RegisterEntity(
        name: name,
        email: email,
        password: password,
        roles: ['user'],
      );

      final isUserRegistered =
          await registerUserUseCase.register(registerEntity);
      if (!isUserRegistered) {
        errorMessage = 'Não foi possível realizar o cadastro';
        status = AuthStatus.unauthenticated;
        return;
      }
      Future.delayed(const Duration(seconds: 3));
      status = AuthStatus.unauthenticated;
    } catch (error) {
      errorMessage = error.toString();
      status = AuthStatus.unauthenticated;
    }
  }

  @action
  Future<void> logout() async {
    try {
      status = AuthStatus.loading;
      final authTokenUseCase = GetIt.I.get<AuthTokenUseCase>();
      await authTokenUseCase.removeToken();

      status = AuthStatus.unauthenticated;
    } catch (error) {
      errorMessage = error.toString();
      status = AuthStatus.authenticated;
    }
  }
}
