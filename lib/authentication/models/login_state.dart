class LoginState {
  String email;
  String password;

  LoginState({this.email = "", this.password = ""});

  LoginState copyWith({String? email, String? password}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginState.fromJson(Map<String, dynamic> json) {
    return LoginState(
      email: json['email'] ?? "",
      password: json['password'] ?? "",
    );
  }
}
