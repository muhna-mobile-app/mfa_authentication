import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource_imp.dart';
import 'package:mfa_authentication/app/data/repositories/auth_remote_repository_imp.dart';
import 'package:mfa_authentication/app/domain/repositories/auth_remote_repository.dart';
import 'package:mfa_authentication/app/domain/usecases/login_user/login_user_usecase.dart';
import 'package:mfa_authentication/app/presentation/controllers/login_controller.dart';

import 'data/datasources/local/auth_local_datasource.dart';
import 'data/datasources/local/auth_local_datasource_imp.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

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

    // useCases
    getIt.registerLazySingleton(() => LogInUserUseCase(getIt()));

    //controllers
    getIt.registerLazySingleton(() => LoginController(getIt()));
  }
}
