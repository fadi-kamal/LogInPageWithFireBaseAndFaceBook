import 'package:baking_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final bool isActive;
  final void Function()? onPressed;
   DefaultText({
  required this.isActive,
  required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            isActive == true?  "SIGN IN" : "SIGN UP",
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            MaterialButton(
              onPressed: onPressed,
              child: Text(
              isActive == true ?  "SIGN UP": "SIGN IN",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: primaryColor,
                    ),
              ),
            )
          ],
        ));
  }
}
