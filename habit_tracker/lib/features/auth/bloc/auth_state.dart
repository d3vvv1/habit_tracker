sealed class AuthState {}

class InitialState extends AuthState {}

// class InCorrectEmail extends AuthState {}

// class InCorrectPassword extends AuthState {}

class SuccessLogin extends AuthState {}

class AuthError extends AuthState {
  final String errorText;

  AuthError({required this.errorText});
}
