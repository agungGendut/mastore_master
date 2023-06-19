part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class ValidationPasswordPassed extends AuthenticationState {
  final bool? isPwCharacter;
  final bool? isPwCapital;
  final bool? isPwNumeric;
  final bool? isPwSymbols;
  final bool? isPwSpace;
  ValidationPasswordPassed({
    required this.isPwCharacter,
    required this.isPwCapital,
    required this.isPwNumeric,
    required this.isPwSymbols,
    required this.isPwSpace,
  });
}

class UserLoginAuthentical extends AuthenticationState {
  final bool userLogin;
  UserLoginAuthentical({required this.userLogin});
}
