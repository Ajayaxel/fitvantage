// custom_exceptions.dart

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppException implements Exception {
  final String message;
  AppException(this.message);

  @override
  String toString() => message;
}

class OperationNotAllowedException extends AppException {
  OperationNotAllowedException() : super('Anonymous accounts are not enabled.');
}

class WeakPasswordException extends AppException {
  WeakPasswordException() : super('Your password is too weak.');
}

class InvalidEmailException extends AppException {
  InvalidEmailException() : super('Your email is invalid.');
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
      : super('Email is already in use on a different account.');
}

class InvalidCredentialException extends AppException {
  InvalidCredentialException() : super('Your email or password is incorrect.');
}

class UndefinedAuthException extends AppException {
  UndefinedAuthException() : super('An undefined error happened.');
}

class Exception402 extends AppException {
  final String? errorMessage;

  Exception402({this.errorMessage})
      : super(errorMessage ?? 'Method not allowed');
}

class MainFailure412 extends AppException {
  final String? errorMessage;

  MainFailure412({this.errorMessage, required requestConflictMessage})
      : super(errorMessage ?? 'Method not allowed');
}

class MainFailure409 extends AppException {
  final String? requestConflictMessage;

  MainFailure409({this.requestConflictMessage})
      : super(requestConflictMessage ?? 'Request Conflicted ');
}

class MainFailure412unauthorized extends AppException {
  final String? unauthorizedMessage;

  MainFailure412unauthorized({this.unauthorizedMessage})
      : super(unauthorizedMessage ?? 'Unauthorized ');
}
class NoInternet extends AppException {
  final String? noInternetmessage;

  NoInternet({this.noInternetmessage})
      : super(noInternetmessage ?? 'No Internet');
}
class Accesdenoted extends AppException {
  final String? mainFailuremessage;

  Accesdenoted({this.mainFailuremessage})
      : super(mainFailuremessage ?? 'Accesdenoted');
}
class NotFound extends AppException {
  final String? mainFailuremessage;

  NotFound({this.mainFailuremessage})
      : super(mainFailuremessage ?? 'Not Found');
}
class ClientFailure extends AppException {
  final String? mainFailuremessage;

  ClientFailure({this.mainFailuremessage})
      : super(mainFailuremessage ?? 'Client eror');
}
class ServerFailure extends AppException {
  final String? mainFailuremessage;

  ServerFailure({this.mainFailuremessage})
      : super(mainFailuremessage ?? 'Server is not found');
}
class Unknown extends AppException {
  final String? mainFailuremessage;

  Unknown({this.mainFailuremessage})
      : super(mainFailuremessage ?? 'Unknown');
}

//fiter sections

class ExceptionFilter {
  static AppException filterException(dynamic e)  {
    if (e is DioException) {
      //1
      if (e.response?.statusCode == 412) {
        return Exception402(errorMessage: e.response?.data['message']);
      }
      //2
      if (e.response?.statusCode == 409) {
        return MainFailure412(
            requestConflictMessage: e.response?.data['message']);
        //3
      } else if (e.response?.statusCode == 401) {
        return MainFailure412unauthorized(
            unauthorizedMessage: e.response?.data['message']);
        //4
      } else if (e.response == null) {
        return  NoInternet();
      } else if (e.response!.statusCode != null &&
          e.response!.statusCode! >= 400 &&
          e.response!.statusCode! < 500) {
        if (e.response!.statusCode == 403) {
          return Accesdenoted(
              mainFailuremessage: e.response?.data['message']);
        } else if (e.response!.statusCode == 404) {
          return NotFound(
              mainFailuremessage: e.response?.data['message']);
        }
        return ClientFailure(
            mainFailuremessage: e.response?.data['message']);
      } else if (e.response!.statusCode != null &&
          e.response!.statusCode! >= 500 &&
          e.response!.statusCode! < 600) {
        return ServerFailure(
            mainFailuremessage: e.response?.data['message']);
      } else {
        return ClientFailure(
            mainFailuremessage: e.response?.data['message']);
      }
    } else {
      return  Unknown();
    }
  }
}

AppException filterExceptions(FirebaseAuthException error) {
  switch (error.code) {
    case 'ERROR_OPERATION_NOT_ALLOWED':
      return OperationNotAllowedException();
    case 'ERROR_WEAK_PASSWORD':
      return WeakPasswordException();
    case 'ERROR_INVALID_EMAIL':
      return InvalidEmailException();
    case 'ERROR_EMAIL_ALREADY_IN_USE':
      return EmailAlreadyInUseException();
    case 'ERROR_INVALID_CREDENTIAL':
      return InvalidCredentialException();
    default:
      return UndefinedAuthException();
  }
}
