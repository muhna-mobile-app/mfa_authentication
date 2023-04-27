import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/domain/entities/register_entity.dart';
import 'package:mfa_authentication/app/domain/usecases/register_user/register_user_usecase.dart';
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
      // perform login operation here
      // if login is successful, set status to AuthStatus.authenticated
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
      status = AuthStatus.authenticated;
    } catch (error) {
      errorMessage = error.toString();
      status = AuthStatus.unauthenticated;
    }
  }

  @action
  Future<void> logout() async {
    // perform logout operation here
    // set status to AuthStatus.unauthenticated
    status = AuthStatus.unauthenticated;
  }
}
