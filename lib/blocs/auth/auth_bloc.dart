import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/repositories/auth_repository.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    
    // Handle Login
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.login(event.email, event.password);
        emit(AuthAuthenticated(user)); // Pass user data to state
      } catch (e) {
        emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
      }
    });

    // Handle Registration
    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      
      // Input validation
      if (event.name.trim().isEmpty) {
        emit(AuthFailure("Name is required"));
        return;
      }
      
      if (event.email.trim().isEmpty) {
        emit(AuthFailure("Email is required"));
        return;
      }
      
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.email)) {
        emit(AuthFailure("Please enter a valid email address"));
        return;
      }
      
      if (event.phone.trim().isEmpty) {
        emit(AuthFailure("Phone number is required"));
        return;
      }
      
      if (event.phone.length < 10) {
        emit(AuthFailure("Please enter a valid phone number"));
        return;
      }
      
      if (event.password.trim().isEmpty) {
        emit(AuthFailure("Password is required"));
        return;
      }
      
      if (event.password.length < 6) {
        emit(AuthFailure("Password must be at least 6 characters long"));
        return;
      }
      
      if (event.confirmPassword.trim().isEmpty) {
        emit(AuthFailure("Please confirm your password"));
        return;
      }
      
      if (event.password != event.confirmPassword) {
        emit(AuthFailure("Passwords do not match"));
        return;
      }
      
      try {
        final message = await repository.register(
          event.name.trim(),
          event.email.trim(),
          event.phone.trim(),
          event.password,
          event.confirmPassword,
        );
        emit(AuthSuccess(message));
      } catch (e) {
        emit(AuthFailure(e.toString().replaceFirst('Exception: ', '')));
      }
    });

    // Check if user is already logged in
    on<CheckAuthStatus>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.getCurrentUser();
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthUnauthenticated());
      }
    });

    // Get current user data
    on<GetCurrentUser>((event, emit) async {
      try {
        final user = await repository.getCurrentUser();
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (e) {
        emit(AuthUnauthenticated());
      }
    });

    // Handle Logout
    on<LogoutRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.logout();
        emit(AuthUnauthenticated());
      } catch (e) {
        emit(AuthFailure("Logout failed"));
      }
    });
  }
}


