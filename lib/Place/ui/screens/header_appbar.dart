import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Widget/title_header.dart';
import '../../../Widget/gradient_back.dart';
import '../widget/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(height: 250.0),
        TitleHeader(
            title: "Popular",
            tamanio: 30.0,
            padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0)),
        CardImageList()
      ],
    );
  }
}
