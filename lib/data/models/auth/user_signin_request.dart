class UserSigninRequest {
  final String email;
  final String password;

  UserSigninRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  UserSigninRequest copyWith({
    String? email,
    String? password,
  }) {
    return UserSigninRequest(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
