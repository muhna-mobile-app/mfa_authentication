import 'package:common_dependencies/common_dependencies.dart';
import 'package:mfa_authentication/app/domain/entities/auth_token_entity.dart';

class AuthTokenModel extends Equatable {
  final String? token;

  const AuthTokenModel({this.token});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      AuthTokenModel(token: json['token']);

  AuthTokenEntity tokenEntity() => AuthTokenEntity(token);

  @override
  List<Object?> get props => [token];
}
