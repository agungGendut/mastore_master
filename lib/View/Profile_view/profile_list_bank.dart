import 'package:flutter/material.dart';

class ProfileListBank extends StatefulWidget{
  const ProfileListBank({super.key});

  @override
  State<ProfileListBank> createState() => ProfileListBankState();
}

class ProfileListBankState extends State<ProfileListBank>{

  Future<bool> onWillPop() async {
    Navigator.of(context).pushReplacementNamed("HomeScreen", arguments: "2");

    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold()
    );
  }
}