class RegisterModel {
  final String name;
  final String email;
  final String password;
  final List<String> roles;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.roles,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'roles': roles,
      };
}
