class LoginRequest {
  final String login;
  final String password;

  LoginRequest({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
    };
  }
}

class RegisterRequest {
  final String firstName;
  final String email;
  final String mobileNumber;
  final String password;
  final String passwordConfirmation;

  RegisterRequest({
    required this.firstName,
    required this.email,
    required this.mobileNumber,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'email': email,
      'mobile_number': mobileNumber,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}

class LoginResponse {
  final int code;
  final String status;
  final String message;
  final UserData? data;
  final Map<String, dynamic>? errors; // 👈 add this

  LoginResponse({
    required this.code,
    required this.status,
    required this.message,
    this.data,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    try {
      return LoginResponse(
        code: json['code'] ?? 0,
        status: json['status'] ?? '',
        message: json['message'] ?? '',
        data: json['data'] != null ? UserData.fromJson(json['data']) : null,
        errors: json['errors'], // 👈 parse validation errors
      );
    } catch (e) {
      print('Error parsing LoginResponse: $e');
      rethrow;
    }
  }
}

class RegisterResponse {
  final int code;
  final String status;
  final String message;
  final Map<String, dynamic>? errors; // 👈 add this

  RegisterResponse({
    required this.code,
    required this.status,
    required this.message,
    this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    try {
      return RegisterResponse(
        code: json['code'] ?? 0,
        status: json['status'] ?? '',
        message: json['message'] ?? '',
        errors: json['errors'], // 👈 parse validation errors
      );
    } catch (e) {
      print('Error parsing RegisterResponse: $e');
      rethrow;
    }
  }
}

class UserData {
  final int id;
  final String name;
  final String token;

  UserData({
    required this.id,
    required this.name,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    try {
      return UserData(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        token: json['token'] ?? '',
      );
    } catch (e) {
      print('Error parsing UserData: $e');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'token': token,
    };
  }
}
