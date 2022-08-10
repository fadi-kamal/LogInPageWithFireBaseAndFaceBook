// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baking_app/Views/Widgets/auth/components/social_media_icon.dart';
import 'package:baking_app/core/constant/app_color.dart';
import 'package:baking_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInTextFromFieldWithIcons extends StatefulWidget {
  SignInTextFromFieldWithIcons({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInTextFromFieldWithIcons> createState() =>
      _SignInTextFromFieldWithIconsState();
}

class _SignInTextFromFieldWithIconsState
    extends State<SignInTextFromFieldWithIcons> {
  GlobalKey<FormState> _KeyFrom = GlobalKey<FormState>();

  var email;

  var password;

  var credential;

  bool? isActive = true;

  formValidator() async {
    var formData = _KeyFrom.currentState!;

    if (formData.validate()) {
      formData.save();

      try {
        credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: context,
                  title: "Not Found User",
                  titleTextStyle: TextStyle(fontSize: 25),
                  padding: EdgeInsets.all(25),
                  dialogType: DialogType.ERROR)
              .show();
        } else if (e.code == 'wrong-password') {
           AwesomeDialog(
                  context: context,
                  title: "Wrong Password",
                  titleTextStyle: TextStyle(fontSize: 25),
                  padding: EdgeInsets.all(25),
                  dialogType: DialogType.ERROR)
              .show();
        }
      }
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Form(
        key: _KeyFrom,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.alternate_email,
                  color: primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onSaved: (newValue) => email = newValue!,
                    validator: (String? newValue) {
                      if (newValue!.length < 4) {
                        return "Email Most Be More than 4  Words";
                      }
                      if (newValue.length >= 100) {
                        return "Email Most Be Less than 100 Words";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.2),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: primaryColor, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor)),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.lock_open,
                  color: primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onSaved: (newValue) => password = newValue!,
                    validator: (String? newValue) {
                      if (newValue!.length < 4) {
                        return "Password Most Be More than 4 ";
                      }
                      if (newValue.length >= 20) {
                        return "Password Most Be Less than 20 ";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isActive!,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.2),
                      hintText: "password",
                      hintStyle: TextStyle(color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isActive = !isActive!;
                          });
                        },
                        icon: Icon(isActive == false
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        color: isActive! == false ? primaryColor : Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: primaryColor, width: 3)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: primaryColor)),
                    ),
                  ),
                )
              ],
            ),
            SocialMediaIcons(onTap: () async {
              //  SharePer!.setString("id", email);
              var user = await formValidator();
              if (user != null) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "homepage", (route) => false);
              }
            }),
          ],
        ),
      ),
    );
  }
}
