import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  ImageContainer({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/perosn.jpeg"), fit: BoxFit.fitWidth)),
    );
  }
}
