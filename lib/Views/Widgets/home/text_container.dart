import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(children: [
        Text(
          "BAKINGESSONS",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          "MASTER THE ART OF BAKING",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.grey),
        ),
      ]),
    );
  }
}