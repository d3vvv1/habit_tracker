import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/services/auth/auth_service.dart';
import 'package:habit_tracker/features/auth/bloc/auth_event.dart';
import 'package:habit_tracker/features/auth/bloc/auth_state.dart';
import 'package:habit_tracker/features/auth/data/basic_user_data.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
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
    if (event.email.isEmpty || !event.email.contains('@')) {
      emit(
        InCorrectEmail(),
      );
    } else {
      _user = _user?.copyWith(email: event.email) ??
          BasicUserData(email: event.email, password: '');
    }
  }

  Future<void> _onEnterPassword(
    EnterPassword event,
    Emitter<AuthState> emit,
  ) async {
    if (event.password.isEmpty || event.password.trim().length < 8) {
      emit(
        InCorrectPassword(),
      );
    } else {
      _user = _user?.copyWith(password: event.password) ??
          BasicUserData(email: '', password: event.password);
    }
  }

  Future<void> _onSignIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {
    if (_user != null) {
      if (_user!.email.isEmpty) {
        emit(InCorrectEmail());
        return;
      } else if (_user!.password.isEmpty) {
        emit(InCorrectPassword());
        return;
      } else {
        try {
          bool res = await _authService.login(_user!);
          if (res) {
            emit(SuccessLogin());
          }
        } catch (e) {
          emit(AuthError(errorText: e.toString()));
        }
      }
    }
  }

  Future<void> _onSignUp(
    SignUp event,
    Emitter<AuthState> emit,
  ) async {
    if (_user != null) {
      if (_user!.email.isEmpty) {
        emit(InCorrectEmail());
        return;
      } else if (_user!.password.isEmpty) {
        emit(InCorrectPassword());
        return;
      } else {
        try {
          bool res = await _authService.signUp(_user!);
          if (res) {
            emit(SuccessLogin());
          }
        } catch (e) {
          emit(AuthError(errorText: e.toString()));
        }
      }
    }
  }
}
