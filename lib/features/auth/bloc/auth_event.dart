sealed class AuthEvent {}

class EnterEmail extends AuthEvent {
  final String email;

  EnterEmail({required this.email});
}

class EnterPassword extends AuthEvent {
  final String password;

  EnterPassword({required this.password});
}

class SignIn extends AuthEvent {}

class SignUp extends AuthEvent {}
