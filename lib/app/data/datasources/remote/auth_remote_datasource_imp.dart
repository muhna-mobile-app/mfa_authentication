import 'package:mfa_authentication/app/data/datasources/remote/auth_remote_datasource.dart';
import 'package:mfa_authentication/app/data/models/auth_token_model.dart';
import 'package:common_dependencies/common_dependencies.dart' show Dio;

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final dio = Dio();

  @override
  Future<AuthTokenModel> postLogin(Map<String, dynamic> loginData) async {
    var response = await dio.post('http://172.21.160.1:3001/api/user/auth',
        data: loginData);
    if (response.statusMessage == '500') {
      throw Exception(response.data);
    }
    final authTokenModel = AuthTokenModel.fromJson(response.data);
    return authTokenModel;
  }

  @override
  Future<AuthTokenModel> postRegister(Map<String, dynamic> registerData) {
    // TODO: implement postRegister
    throw UnimplementedError();
  }
}
