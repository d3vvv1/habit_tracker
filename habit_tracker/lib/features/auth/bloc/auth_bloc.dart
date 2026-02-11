import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_validator.dart';
import 'package:habit_tracker/core/services/auth/network_servise.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';
import 'package:habit_tracker/features/auth/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final NetworkService _networkService = NetworkService();
  String? _userEmail;
  String? _password;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(InitialState()) {
    on<EnterEmail>(_onEnterEmail);
    on<EnterPassword>(_onEnterPassword);
    on<SignIn>(_onSignIn);
    on<SignUp>(_onSignUp);
  }

  Future<void> _onEnterEmail(
    EnterEmail event,
    Emitter<AuthState> emit,
  ) async {
    try {
      bool res = AuthValidator.validateEmail(event.email);
      if (res) {
        _userEmail = event.email;
      }
    } catch (e) {
      emit(
        AuthError(
          errorText: e.toString().split(':').last,
        ),
      );
    }
  }

  Future<void> _onEnterPassword(
    EnterPassword event,
    Emitter<AuthState> emit,
  ) async {
    try {
      bool res = AuthValidator.validatePassword(event.password);
      if (res) {
        _password = event.password;
      }
    } catch (e) {
      emit(
        AuthError(
          errorText: e.toString().split(':').last,
        ),
      );
    }
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {
    if (_userEmail != null) {
      try {
        bool correctEmail = AuthValidator.validateEmail(_userEmail!);
        bool correctPassword = AuthValidator.validatePassword(_password!);
        if (correctPassword & correctEmail) {
          bool res = await _networkService.executeWithRetry(
              () => _authService.login(_userEmail!, _password!));
          if (res) {
            emit(SuccessLogin());
          }
        }
      } catch (e) {
        emit(
          AuthError(
            errorText: e.toString().split(':').last,
          ),
        );
      }
    }
  }

  Future<void> _onSignUp(
    SignUp event,
    Emitter<AuthState> emit,
  ) async {
    if (_userEmail != null) {
      try {
        bool correctEmail = AuthValidator.validateEmail(_userEmail!);
        bool correctPassword = AuthValidator.validatePassword(_password!);
        if (correctPassword & correctEmail) {
          bool res = await _networkService.executeWithRetry(
              () => _authService.signUp(_userEmail!, _password!));
          if (res) {
            emit(SuccessLogin());
          }
        }
      } catch (e) {
        emit(
          AuthError(
            errorText: e.toString().split(':').last,
          ),
        );
      }
    }
  }
}
