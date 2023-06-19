import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Bloc/Auth_bloc/authentication_bloc.dart';
import 'package:mastore/Core/utils/palette.dart';

import '../../Core/utils/constants.dart';
import '../../Model/pw_validation_type_model.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Core/widgets/basic_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  var isPasswordVisible = false;
  var isRePasswordVisible = false;

  bool isNameError = false;
  bool isEmailError = false;
  bool isPhoneError = false;
  bool isPasswordError = false;
  bool isRePasswordError = false;
  String? errorEmailText;
  String? errorPhoneText;
  String? errorPassword;
  String? errorRePassword;

  bool isPwCharError = false;
  bool isPwCapitalError = false;
  bool isPwNumericalError = false;
  bool isPwSpaceError = false;
  bool isPwSymbolError = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onWillPop() async {
    Navigator.of(context).pushReplacementNamed("LoginScreen");

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(),
            flexibleSpace: Container(
              margin: const EdgeInsets.only(left: 15, top: 40),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => onWillPop(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StandarText.label("Back to Login Page", 14.0)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, authState) {
              if (authState is ValidationPasswordPassed) {
                isPwCharError = authState.isPwCharacter ?? false;
                print("pwd char $isPwCharError");
                isPwCapitalError = authState.isPwCapital ?? false;
                print("pwd Capital $isPwCapitalError");
                isPwNumericalError = authState.isPwNumeric ?? false;
                print("pwd Numeric $isPwNumericalError");
                isPwSymbolError = authState.isPwSymbols ?? false;
                print("pwd Symbol $isPwSymbolError");
                isPwSpaceError = authState.isPwSpace ?? false;
                print("pwd Space $isPwSpaceError");
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(AppIcons.ic_logo, width: 200)),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Text(
                      "Create your Account",
                      style: Palette.mdlHeading2
                          .copyWith(color: Palette.mdlSpaceCadet100, height: 0),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: BasicBorderedTextField(
                        controller: nameController,
                        hintText: AppConstants.text_fullname,
                        errorText:
                            isNameError ? "Please fill in your fullname" : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 2),
                      child: Text(
                          "${AppConstants.text_example_} Putri Ramadhani",
                          style: Palette.mdlBodyRegular.copyWith(
                              color: Palette.mdlSpaceCadet60, height: 0)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: BasicBorderedTextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppConstants.text_email,
                        errorText: isEmailError ? errorEmailText : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 2),
                      child: Text(
                          "${AppConstants.text_example_} putri@gmail.com",
                          style: Palette.mdlBodyRegular.copyWith(
                              color: Palette.mdlSpaceCadet60, height: 0)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: BasicBorderedTextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        hintText: AppConstants.text_phone,
                        errorText: isPhoneError ? errorPhoneText : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 2),
                      child: Text("${AppConstants.text_example_} 0856xxxxxxxx",
                          style: Palette.mdlBodyRegular.copyWith(
                              color: Palette.mdlSpaceCadet60, height: 0)),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: BasicBorderedTextField(
                        controller: passwordController,
                        maxLength: 12,
                        isPasswordType: !isPasswordVisible,
                        hintText: AppConstants.text_password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: Palette.mdlSpaceCadet60,
                          ),
                        ),
                        errorText: isPasswordError ? errorPassword : null,
                        onChangedFunc: (text) {
                          context.read<AuthenticationBloc>().add(
                              ValidationPassword(
                                  PwValidationType.character, text));
                          context.read<AuthenticationBloc>().add(
                              ValidationPassword(
                                  PwValidationType.capital, text));
                          context.read<AuthenticationBloc>().add(
                              ValidationPassword(
                                  PwValidationType.numeric, text));
                          context.read<AuthenticationBloc>().add(
                              ValidationPassword(
                                  PwValidationType.symbol, text));
                          context.read<AuthenticationBloc>().add(
                              ValidationPassword(PwValidationType.space, text));
                          // if (isPwCharError == false){
                          //
                          // } else if (isPwNumericalError == false){
                          //
                          // } else if (isPwSymbolError == false){
                          //
                          // } else {
                          //
                          // }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: BasicBorderedTextField(
                        controller: repasswordController,
                        maxLength: 12,
                        isPasswordType: !isRePasswordVisible,
                        hintText: AppConstants.text_retype_password,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isRePasswordVisible = !isRePasswordVisible;
                            });
                          },
                          icon: Icon(
                            isRePasswordVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            size: 20,
                            color: Palette.mdlSpaceCadet60,
                          ),
                        ),
                        errorText: isRePasswordError ? errorRePassword : null,
                      ),
                    ),
                    SizedBox(height: 28),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: isPwCharError == false
                                  ? Palette.mdlSpaceCadet60
                                  : Palette.mdlVerindianGreen60,
                              size: 14),
                          SizedBox(width: 8),
                          Text(
                            AppConstants.text_8_12_characters,
                            style: Palette.mdlBodyRegular.copyWith(
                                color: Palette.mdlSpaceCadet60, height: 0),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.check_circle,
                              color: isPwCapitalError == false
                                  ? Palette.mdlSpaceCadet60
                                  : Palette.mdlVerindianGreen60,
                              size: 14),
                          SizedBox(width: 8),
                          Text(
                            AppConstants.text_atleast_one_capital_letter,
                            style: Palette.mdlBodyRegular.copyWith(
                                color: Palette.mdlSpaceCadet60, height: 0),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: isPwNumericalError == false
                                  ? Palette.mdlSpaceCadet60
                                  : Palette.mdlVerindianGreen60,
                              size: 14),
                          SizedBox(width: 8),
                          Text(
                            AppConstants.text_atleast_one_numerical,
                            style: Palette.mdlBodyRegular.copyWith(
                                color: Palette.mdlSpaceCadet60, height: 0),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.check_circle,
                              color: isPwSpaceError == false
                                  ? Palette.mdlSpaceCadet60
                                  : Palette.mdlVerindianGreen60,
                              size: 14),
                          SizedBox(width: 8),
                          Text(
                            AppConstants.text_no_spaces,
                            style: Palette.mdlBodyRegular.copyWith(
                                color: Palette.mdlSpaceCadet60, height: 0),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: isPwSymbolError == false
                                  ? Palette.mdlSpaceCadet60
                                  : Palette.mdlVerindianGreen60,
                              size: 14),
                          SizedBox(width: 8),
                          Text(
                            AppConstants.text_atleast_one_symbol,
                            style: Palette.mdlBodyRegular.copyWith(
                                color: Palette.mdlSpaceCadet60, height: 0),
                          ),
                          // SizedBox(width: 10),
                          // Icon(Icons.check_circle,
                          //     color: isPwSpaceError.value ? AppColors.textLightGrey : AppColors.greenColor,
                          //     size: 14),
                          // SizedBox(width: 8),
                          // Text(AppConstants.text_no_spaces,
                          //   style: AppTextStyles.footnoteSemiGrey,
                          // )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width / 1,
                      child: RichText(
                        text: TextSpan(
                          style: Palette.mdlBodyRegular.copyWith(
                              color: Palette.mdlSpaceCadet60, height: 0),
                          children: <TextSpan>[
                            const TextSpan(
                                text: AppConstants.text_by_clicking_sign_up_),
                            TextSpan(
                              text: AppConstants.text_terms,
                              style: Palette.mdlBodyRegular.copyWith(
                                  color: Palette.mdlEnglishVermilion60,
                                  height: 0),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const TextSpan(
                                text: AppConstants.text_and_that_you_have_),
                            TextSpan(
                              text: AppConstants.text_data_user_policy,
                              style: Palette.mdlBodyRegular.copyWith(
                                  color: Palette.mdlSpaceCadet60, height: 0),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 34),
                    GestureDetector(
                      onTap: () {
                        context.read<AuthenticationBloc>().add(AuthSignupUser(
                            nameController.text,
                            emailController.text,
                            phoneController.text,
                            passwordController.text,
                            repasswordController.text));
                      },
                      child: Container(
                        height: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Palette.mdlVerindianGreen100,
                            borderRadius: BorderRadius.circular(16)),
                        child: Text(
                          "Submit",
                          style: Palette.mdlBodyRegular.copyWith(
                              color: Palette.mdlBasicWhite, height: 0),
                        ),
                      ),
                    ),
                  ]))
                ],
              ),
            ),
          ),
        ));
  }

  bool _validation() {
    setState(() {
      isNameError = nameController.text.isEmpty;
      isEmailError = emailController.text.isEmpty;
      isPasswordError = passwordController.text.isEmpty;
      isRePasswordError = passwordController.text.isEmpty;

      if (emailController.text.isEmpty) {
        errorEmailText = "Please fill in your email";
        isEmailError = true;
      } else if (emailController.text.isEmpty) {
        errorEmailText = "Incorrect email address";
        isEmailError = true;
      } else {
        isEmailError = false;
      }

      if (passwordController.text.isEmpty) {
        errorPassword = "Please fill in your password";
        isPasswordError = true;
      } else if (isPwCharError ||
          isPwCapitalError ||
          isPwNumericalError ||
          isPwSymbolError ||
          isPwSpaceError) {
        errorPassword = "Password doesn't meet the requirements";
        isPasswordError = true;
      } else {
        isPasswordError = false;
      }

      if (repasswordController.text.isEmpty) {
        errorRePassword = "Please fill in your re-type password";
        isRePasswordError = true;
      } else if (passwordController.text != repasswordController.text) {
        errorRePassword = "Password doesn't match";
        isRePasswordError = true;
      } else {
        isRePasswordError = false;
      }
    });

    if (isNameError || isEmailError || isPasswordError || isRePasswordError) {
      return false;
    }

    return true;
  }
}
