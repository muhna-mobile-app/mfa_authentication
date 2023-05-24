import 'package:common_dependencies/common_dependencies.dart';
import 'auth_local_datasource.dart';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  // final prefs = GetIt.I.get<SharedPreferences>();

  @override
  Future<String?> get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      return prefs.getString('token');
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> save(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedResult = await prefs.setString('token', token);

    if (!savedResult) {
      throw Exception('Não foi possível salvar o token');
    }
  }

  @override
  Future<void> remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final removedResult = await prefs.remove('token');

    if (!removedResult) {
      throw Exception('Não foi possível realizar a operação. Tente novamente.');
    }
  }
}
