import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:baking_app/Views/Widgets/auth/components/social_media_icon.dart';
import 'package:baking_app/core/constant/app_color.dart';
import 'package:baking_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpTextFormField extends StatefulWidget {
  SignUpTextFormField({Key? key}) : super(key: key);

  @override
  State<SignUpTextFormField> createState() => _SignUpTextFormFieldState();
}

class _SignUpTextFormFieldState extends State<SignUpTextFormField> {
  GlobalKey<FormState> _KeyForm = GlobalKey<FormState>();
  var email, fName, lName;
  var password;
  var credential;
  bool? isActive = true;

  CreateEmail() async {
    var formdate = _KeyForm.currentState!;
    if (formdate.validate()) {
      formdate.save();
      try {
        credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: context,
                  title: "Weak Password",
                  titleTextStyle: TextStyle(fontSize: 25),
                  padding: EdgeInsets.all(25),
                  dialogType: DialogType.ERROR)
              .show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: "Email Already Used",
                  titleTextStyle: TextStyle(fontSize: 25),
                  padding: EdgeInsets.all(25),
                  dialogType: DialogType.ERROR)
              .show();
        }
      } catch (e) {
        return print("${e}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _KeyForm,
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
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onSaved: (newValue) => fName = newValue!,
                    validator: (String? newValue) {
                      if (newValue!.length < 4) {
                        return "First Name Most Be More than 4  Words";
                      }
                      if (newValue.length >= 100) {
                        return "First Name Most Be Less than 100 Words";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.2),
                      hintText: "First Name",
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
                  Icons.person,
                  color: primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextFormField(
                    onSaved: (newValue) => lName = newValue!,
                    validator: (String? newValue) {
                      if (newValue!.length < 4) {
                        return "Last NameMost Be More than 4  Words";
                      }
                      if (newValue.length >= 100) {
                        return "Last Name Most Be Less than 100 Words";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.2),
                      hintText: "Last Name",
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
              height: 40,
            ),
            SocialMediaIcons(onTap: () async {
              var user = await CreateEmail();
              // SharePer!.setString("id", fName);
              if (user != null) {
                await FirebaseFirestore.instance.collection("Users").add({
                  "Email": email,
                  "Password": password,
                  "FirstName": fName,
                  "LastName": lName
                });
                Navigator.pushNamedAndRemoveUntil(
                    context, "homepage", (route) => false);
              }
            })
          ],
        ),
      ),
    );
  }
}
