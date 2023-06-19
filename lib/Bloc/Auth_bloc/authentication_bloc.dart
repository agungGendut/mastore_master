import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mastore/Core/services/Api_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/pw_validation_type_model.dart';
import '../../Model/signup_model.dart';
import '../../Model/userLogin_wrapper.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  bool? isLogin;
  bool? isPwCharacter;
  bool? isPwCapital;
  bool? isPwNumeric;
  bool? isPwSymbols;
  bool? isPwSpace;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      await mapEventToStates(event, emit);
    });
  }

  Future<void> mapEventToStates(
      AuthenticationEvent event, Emitter<AuthenticationState> emit
      ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (event is CheckUserLogin){
      isLogin = preferences.getBool("userLogin") ?? false;
      if (isLogin == false){
        emit(UserLoginAuthentical(userLogin: false));
      } else {
        emit(UserLoginAuthentical(userLogin: true));
      }
    }

    if (event is ValidationPassword){
      var pattern = "";

      // Regex pattern source: https://stackoverflow.com/a/56256456
      switch (event.type) {
        case PwValidationType.space:
          pattern = "^[a-zA-Z]+(?:\s[a-zA-Z]+)*";
          RegExp regExp = RegExp(pattern);
          isPwSpace = regExp.hasMatch(event.text);
          break;
        case PwValidationType.character:
          pattern = ".{8,}";
          RegExp regExp = RegExp(pattern);
          isPwCharacter = regExp.hasMatch(event.text);
          break;
        case PwValidationType.capital:
          pattern = "(?=.*[A-Z])";
          RegExp regExp = RegExp(pattern);
          isPwCapital = regExp.hasMatch(event.text);
          break;
        case PwValidationType.numeric:
          pattern = "(?=.*?[0-9])";
          RegExp regExp = RegExp(pattern);
          isPwNumeric = regExp.hasMatch(event.text);
          break;
        case PwValidationType.symbol:
          pattern = "(?=.*?[!@#\$&*~])";
          RegExp regExp = RegExp(pattern);
          isPwSymbols = regExp.hasMatch(event.text);
          break;
      }

      emit(ValidationPasswordPassed(
          isPwCharacter: isPwCharacter,
          isPwCapital: isPwCapital,
          isPwNumeric: isPwNumeric,
          isPwSymbols: isPwSymbols,
          isPwSpace: isPwSpace,
      ));
    }

    if (event is AuthLoginUser){
      UserLoginWrapper response = await ApiRepository.loginAuth(event.userName, event.password, "");
      preferences.setString("UserData", json.encode(response));
      preferences.setBool("userLogin", true);
      emit(UserLoginAuthentical(userLogin: true));
    }

    if (event is AuthSignupUser){
      SignUpWrapper response = await ApiRepository.loginSignup(
          event.username, event.email, event.telephone, event.password, event.retypePassword);
    }

  }
}
