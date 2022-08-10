import 'package:baking_app/Views/Screen/home/home.dart';
import 'package:baking_app/Views/auth/signIn/singIn_Screen.dart';
import 'package:baking_app/Views/auth/signUp/sign_up_screen.dart';
import 'package:baking_app/Views/home_page_screen.dart';
import 'package:baking_app/main.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(32, 32, 32, 1.0)
          ),
          routes: {
            "homepage" :(context) => HomePageScreen(),
            "SignIn" :(context) => SignInSrceen(),
            "SignUp" :(context) => SignUpScreen(),
          },
      home:Home()
    );
  }
}
