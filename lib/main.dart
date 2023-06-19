import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/services/bloc_setup.dart';
import 'Core/utils/constants.dart';
import 'Core/routers/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: titleApp,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: router.generateRoute,
        initialRoute: 'SplashScreen',
      ),
    );
  }
}
