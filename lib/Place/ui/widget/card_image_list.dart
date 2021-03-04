import 'package:flutter/material.dart';
import '../../../Place/ui/widget/card_image.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.only(left: 10.0, bottom: 25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(
              pathImage: "assets/img/beach_palm.jpeg",
              width: 350,
              height: 250,
              left: 20.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              pathImage: "assets/img/mountain.jpeg",
              width: 350,
              height: 250,
              left: 20.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              pathImage: "assets/img/mountain_stars.jpeg",
              width: 350,
              height: 250,
              left: 20.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              pathImage: "assets/img/river.jpeg",
              width: 350,
              height: 250,
              left: 20.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
          CardImageWithFabIcon(
              pathImage: "assets/img/sunset.jpeg",
              width: 350,
              height: 250,
              left: 20.0,
              iconData: Icons.favorite_border,
              onPressedFabIcon: () {}),
        ],
      ),
    );
  }
}
