class RegisterEntity {
  final String name;
  final String email;
  final String password;
  final List<String> roles;

  RegisterEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.roles,
  });
}
