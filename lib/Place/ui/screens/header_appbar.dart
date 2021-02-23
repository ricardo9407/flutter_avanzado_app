import 'package:flutter/material.dart';
import '../../../Widget/gradient_back.dart';
import '../widget/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Stack(
      children: <Widget>[GradientBack("Bienvenido"), CardImageList()],
    );
  }
}
