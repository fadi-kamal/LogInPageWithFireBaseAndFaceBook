import 'package:baking_app/Views/Widgets/auth/components/default_text.dart';
import 'package:baking_app/Views/Widgets/auth/signUp/signup_textFormField_icon.dart';
import 'package:baking_app/Views/Widgets/auth/signin/signin_textFormField_Icon.dart';

import 'package:baking_app/Views/Widgets/home/image_container.dart';

import 'package:flutter/material.dart';

class SignInSrceen extends StatefulWidget {
  SignInSrceen({Key? key}) : super(key: key);

  @override
  State<SignInSrceen> createState() => _SignInSrceenState();
}

class _SignInSrceenState extends State<SignInSrceen> {
  var email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ImageContainer(height: 380),
          DefaultText(
              isActive: true,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, "SignUp", (route) => false)),
                  SignInTextFromFieldWithIcons(),
              
        ],
      ),
    );
  }
}
