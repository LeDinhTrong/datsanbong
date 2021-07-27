class LoginModel {
  final String email;
  final String password;
  LoginModel({required this.email, required this.password});

  LoginModel copyWith({String? username, String? password}) {
    return LoginModel(
      email: username ?? this.email,
      password: password ?? this.password,
    );
  }
}
