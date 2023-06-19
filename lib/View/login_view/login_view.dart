import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mastore/Core/utils/palette.dart';

import '../../Bloc/Auth_bloc/authentication_bloc.dart';
import '../../Core/helpers/flutter_screen_scaler.dart';
import '../../Core/utils/constants.dart';
import '../../Core/widgets/StandarText.dart';
import '../../Core/widgets/basic_textfield.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>{
  TextEditingController userNamelogin = TextEditingController();
  TextEditingController passwordlogin = TextEditingController();

  bool isEmailError = false;
  bool isPasswordError = false;
  String? errorEmailText;
  var isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> onWillPop() async {
    Navigator.of(context).pushReplacementNamed("HomeScreen", arguments: "0");

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = ScreenScaler()..init(context);
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Container(),
          flexibleSpace: Container(
            margin: const EdgeInsets.only(left: 15,top: 40),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => onWillPop(),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
                      SizedBox(width: 15,),
                      StandarText.label("Back to Home", 14.0)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, loginState){
            if (loginState is UserLoginAuthentical){
              Navigator.of(context).pushReplacementNamed('HomeScreen', arguments: "0");
            }
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                      margin: const EdgeInsets.only(top: 80),
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(AppIcons.ic_logo,
                          width: 200)),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 80, top: 24, right: 50, bottom: 16),
                        child: StandarText.header1("Login", 24.0),
                      ),
                      Container(
                        height: scaler.getHeight(5),
                        width: scaler.getWidth(60),
                        child: BasicBorderedTextField(
                          controller: userNamelogin,
                          keyboardType: TextInputType.emailAddress,
                          hintText: "Username / Phone",
                          errorText: isEmailError ? errorEmailText : null,
                        ),
                      ),
                      Container(
                        height: scaler.getHeight(5),
                        width: scaler.getWidth(60),
                        child: BasicBorderedTextField(
                          controller: passwordlogin,
                          isPasswordType: !isPasswordVisible,
                          hintText: "Password",
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
                              color: Palette.textColor,
                            ),
                          ),
                          errorText:
                          isPasswordError ? "Please fill in your password" : null,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: scaler.getWidth(60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: const Text("Forgot Password ?", style: TextStyle(color: Colors.blue),),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          context.read<AuthenticationBloc>().add(AuthLoginUser(userNamelogin.text, passwordlogin.text));
                        },
                        child: Container(
                          height: scaler.getHeight(3),
                          width: scaler.getWidth(60),
                          margin: const EdgeInsets.only(top: 34),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(16)
                          ),
                          child: StandarText.label("Submit", 18.0, Colors.white),
                        ),
                      ),

                      Container(
                        margin: scaler.getMarginLTRB(2, 2, 2, 2),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 55.0, right: 20.0),
                                child: const Divider(
                                  color: Palette.mdlSpaceCadet40,
                                  height: 36,
                                )),
                          ),
                          Text(
                            " or ",
                            style: Palette.mdlBodyMedium.copyWith(
                              color: Palette.mdlSpaceCadet40,
                              height: 0,
                            ),
                          ),
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.only(left: 20.0, right: 55.0),
                                child: const Divider(
                                  color: Palette.mdlSpaceCadet40,
                                  height: 36,
                                )),
                          ),
                        ]),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("SignupScreen");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You don't have an account? ",
                              style: Palette.mdlBodyMedium.copyWith(
                                color: Palette.mdlSpaceCadet80,
                                height: 0,
                              ),
                            ),
                            Text(
                              "Sign up",
                              style: Palette.mdlBodyMedium.copyWith(
                                  color: Palette.mdlEnglishVermilion80,
                                  height: 0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}