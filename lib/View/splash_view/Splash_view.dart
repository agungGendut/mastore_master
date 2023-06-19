import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Core/utils/constants.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>{
  final _storage = const FlutterSecureStorage();

  @override
  void initState() {
    checkAuth();

    super.initState();
  }

  checkAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 5), () async {
      var loggedIn = prefs.getBool("userLogin") ?? false;

      if (loggedIn == true) {
        Navigator.pushReplacementNamed(context, "HomeScreen", arguments: "0");
      } else {
        Navigator.pushReplacementNamed(context, "LoginScreen");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(AppIcons.ic_logo,
                              width: 200)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Text(
                      "App Version\n$versiAplikasi",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}