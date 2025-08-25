abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;
  LoginRequested(this.email, this.password);
}

class RegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  RegisterRequested(this.name, this.email, this.phone, this.password, this.confirmPassword);
}

// New events for user management
class CheckAuthStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class GetCurrentUser extends AuthEvent {}



