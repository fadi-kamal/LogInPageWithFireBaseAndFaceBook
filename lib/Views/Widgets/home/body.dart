import 'package:baking_app/Views/Widgets/home/button_container.dart';
import 'package:baking_app/Views/Widgets/home/image_container.dart';
import 'package:baking_app/Views/Widgets/home/text_container.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ImageContainer(height: 500,),
      TextContainer(),
      ButtonContainer()
    ]);
  }
}





