import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/core/services/auth/auth_validator.dart';
import 'package:habit_tracker/core/services/auth/network_servise.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';
import 'package:habit_tracker/features/auth/bloc/auth_state.dart';
import 'package:habit_tracker/features/auth/data/basic_user_data.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final NetworkService _networkService = NetworkService();
  BasicUserData? _user;

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
        _user = _user?.copyWith(email: event.email) ??
            BasicUserData(email: event.email, password: '');
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
        _user = _user?.copyWith(password: event.password) ??
            BasicUserData(email: '', password: event.password);
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
    if (_user != null) {
      try {
        bool correctEmail = AuthValidator.validateEmail(_user!.email);
        bool correctPassword = AuthValidator.validatePassword(_user!.password);
        if (correctPassword & correctEmail) {
          bool res = await _networkService
              .executeWithRetry(() => _authService.login(_user!));
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
    if (_user != null) {
      try {
        bool correctEmail = AuthValidator.validateEmail(_user!.email);
        bool correctPassword = AuthValidator.validatePassword(_user!.password);
        if (correctPassword & correctEmail) {
          bool res = await _networkService
              .executeWithRetry(() => _authService.signUp(_user!));
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
