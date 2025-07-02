import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await repository.login(event.email, event.password);
        emit(AuthSuccess("Login successful"));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final message = await repository.register(
          event.name, event.email, event.phone, event.password, event.confirmPassword);
        emit(AuthSuccess(message));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
