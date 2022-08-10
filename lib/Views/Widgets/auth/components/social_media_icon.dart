// ignore_for_file: unused_field, unused_local_variable

import 'package:baking_app/core/constant/app_color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SocialMediaIcons extends StatefulWidget {
  final void Function() onTap;
  SocialMediaIcons({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<SocialMediaIcons> createState() => _SocialMediaIconsState();
}

class _SocialMediaIconsState extends State<SocialMediaIcons> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  _checlIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }

  _logIn() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.accessToken == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }
    setState(() {
      Navigator.pushReplacementNamed(context, "homepage");
      _checking = false;
    });
  }

  logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  void initState() {
    _checlIfisLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              await _checlIfisLoggedIn();
              await _logIn();
              setState(() {
                _checking = !_checking;
              });
            },
            child: Image.asset(
              "assets/facebook.png",
              height: 50,
              width: 50,
              color: primaryColor,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/twitter.png",
            height: 50,
            width: 50,
            color: primaryColor,
          ),
          Spacer(),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(50)),
              child: Icon(Icons.arrow_right_alt_rounded),
            ),
          )
        ],
      ),
    );
  }
}
