import 'package:baking_app/Views/Screen/home/home.dart';
import 'package:baking_app/Views/auth/signIn/singIn_Screen.dart';
import 'package:baking_app/Views/auth/signUp/sign_up_screen.dart';
import 'package:baking_app/Views/home_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



bool isActive = false;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var users = FirebaseAuth.instance.currentUser;

  if (users != null) isActive = true;
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(32, 32, 32, 1.0)),
        routes: {
          "homepage": (context) => HomePageScreen(),
          "SignIn": (context) => SignInSrceen(),
          "SignUp": (context) => SignUpScreen(),
        },
        home: isActive == false ? Home() : HomePageScreen());
  }
}
