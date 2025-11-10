class BasicUserData {
  final String email;
  final String password;

  BasicUserData({required this.email, required this.password});

  BasicUserData copyWith({
    String? email,
    String? password,
  }) {
    return BasicUserData(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
