part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class CheckUserLogin extends AuthenticationEvent {}

class ValidationPassword extends AuthenticationEvent {
  final PwValidationType type;
  final String text;
  ValidationPassword(this.type, this.text);
}

class AuthLoginUser extends AuthenticationEvent {
  final String userName;
  final String password;
  AuthLoginUser(this.userName, this.password);
}

class AuthSignupUser extends AuthenticationEvent {
  final String username;
  final String email;
  final String telephone;
  final String password;
  final String retypePassword;
  AuthSignupUser(this.username, this.email, this.telephone, this.password, this.retypePassword);
}
