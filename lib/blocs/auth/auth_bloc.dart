// bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/models/auth_model.dart';
import 'package:my_app/repositories/auth_repository.dart';


// Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String login;
  final String password;

  const LoginRequested({
    required this.login,
    required this.password,
  });

  @override
  List<Object> get props => [login, password];
}

class RegisterRequested extends AuthEvent {
  final String firstName;
  final String email;
  final String mobileNumber;
  final String password;
  final String passwordConfirmation;

  const RegisterRequested({
    required this.firstName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  List<Object> get props =>
      [firstName, email, mobileNumber, password, passwordConfirmation];
}

class CheckAuthStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserData userData;

  const AuthAuthenticated({required this.userData});

  @override
  List<Object> get props => [userData];
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String errors;

  const AuthError({required this.errors});

  @override
  List<Object> get props => [errors];
}

class RegisterSuccess extends AuthState {
  final String message;

  const RegisterSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<CheckAuthStatus>(_onCheckAuthStatus);
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final isLoggedIn = await _authRepository.isLoggedIn();

      if (isLoggedIn) {
        final userData = await _authRepository.getStoredUserData();
        if (userData != null) {
          emit(AuthAuthenticated(userData: userData));
        } else {
          emit(AuthUnauthenticated());
        }
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Validate input
      if (event.login.isEmpty) {
        emit(const AuthError(
            errors: 'Please enter your email or mobile number'));
        return;
      }

      if (event.password.isEmpty) {
        emit(const AuthError(errors: 'Please enter your password'));
        return;
      }

      final loginRequest = LoginRequest(
        login: event.login,
        password: event.password,
      );

      final response = await _authRepository.login(loginRequest);

      if (response.code == 200 &&
          response.status == 'success' &&
          response.data != null) {
        emit(AuthAuthenticated(userData: response.data!));
      } else {
        // Use detailed errors if available
        final detailedError = _extractErrors(response);
        emit(AuthError(errors: detailedError));
      }
    } catch (e) {
      emit(const AuthError(
          errors: 'An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Validate input
      if (event.firstName.isEmpty) {
        emit(const AuthError(errors: 'Please enter your name'));
        return;
      }

      if (event.email.isEmpty) {
        emit(const AuthError(errors: 'Please enter your email'));
        return;
      }

      if (!_isValidEmail(event.email)) {
        emit(const AuthError(errors: 'Please enter a valid email address'));
        return;
      }

      if (event.mobileNumber.isEmpty) {
        emit(const AuthError(errors: 'Please enter your mobile number'));
        return;
      }

      if (event.password.isEmpty) {
        emit(const AuthError(errors: 'Please enter your password'));
        return;
      }

      if (event.password != event.passwordConfirmation) {
        emit(const AuthError(
            errors: 'Password and confirm password do not match'));
        return;
      }

      final registerRequest = RegisterRequest(
        firstName: event.firstName,
        email: event.email,
        mobileNumber: event.mobileNumber,
        password: event.password,
        passwordConfirmation: event.passwordConfirmation,
      );

      final response = await _authRepository.register(registerRequest);

      if (response.code == 200 && response.status == 'success') {
        emit(RegisterSuccess(message: response.message));
      } else {
        // Use detailed errors if available
        final detailedError = _extractErrors(response);
        emit(AuthError(errors: detailedError));
      }
    } catch (e) {
      emit(const AuthError(
          errors: 'An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await _authRepository.logout();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(const AuthError(errors: 'Failed to logout. Please try again.'));
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Helper function to extract detailed error messages from response
String _extractErrors(dynamic response) {
  if (response.errors != null && response.errors!.isNotEmpty) {
    return response.errors!.values
        .map((e) => (e as List).join(', '))
        .join('\n');
  }
  return response.message;
}
}



