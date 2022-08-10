import 'package:baking_app/Views/Widgets/auth/components/default_text.dart';
import 'package:baking_app/Views/Widgets/auth/signUp/signup_textFormField_icon.dart';
import 'package:baking_app/Views/Widgets/home/image_container.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ImageContainer(height: 380),
          DefaultText(
              isActive: false,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, "SignIn", (route) => false)),
                  SignUpTextFormField()
         
        ],
      ),
    );
  }
}
