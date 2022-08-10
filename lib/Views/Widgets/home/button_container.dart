import 'package:baking_app/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30 , horizontal: 30 ),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: primaryColor,
        onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "SignIn", (route) => false),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'START LEARNING',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_right_alt,
              size: 45,
            )
          ],
        ),
      ),
    );
  }
}
