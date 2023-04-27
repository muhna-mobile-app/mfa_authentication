import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource_imp.dart';
import 'package:mfa_authentication/app/data/repositories/auth_local_repository_imp.dart';
import 'package:mfa_authentication/app/data/repositories/auth_remote_repository_imp.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_local_repository.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';
import 'package:mfa_authentication/app/domain/usecases/login_user/login_user_usecase.dart';
import 'package:mfa_authentication/app/domain/usecases/register_user/register_user_usecase.dart';
import 'package:mfa_authentication/app/presentation/controllers/login_controller.dart';

import 'data/datasources/local/auth_local_datasource.dart';
import 'data/datasources/local/auth_local_datasource_imp.dart';
import 'domain/usecases/auth_token/auth_token_usecase.dart';
import 'presentation/stores/auth_store.dart';
import 'presentation/stores/register_form_store.dart';

class Inject {
  static void init(GetIt getIt) {
    // datasources
    getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
    getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImp(),
    );

    //repositories
    getIt.registerLazySingleton<AuthRemoteRepository>(
      () => AuthRemoteRepositoryImp(getIt()),
    );
    getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepositoryImp(getIt()),
    );

    // useCases
    getIt.registerSingleton<LogInUserUseCase>(LogInUserUseCase(getIt()));
    getIt.registerSingleton<AuthTokenUseCase>(AuthTokenUseCase(getIt()));
    getIt.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(getIt()));

    //controllers
    getIt.registerLazySingleton(() => LoginController());

    //Stores
    getIt.registerSingleton<RegisterFormStore>(RegisterFormStore());
    getIt.registerSingleton<AuthStore>(AuthStore());
  }
}
