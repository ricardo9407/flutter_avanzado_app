import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../Widget/floating_action_button_green.dart';

// ignore: must_be_immutable
class CardImageWithFabIcon extends StatelessWidget {
  final double height;
  final double width;
  final double left;
  final String pathImage;
  final VoidCallback onPressedFabIcon;
  final IconData iconData;
  bool internet = true;
  CardImageWithFabIcon(
      {Key key,
      @required this.pathImage,
      @required this.width,
      @required this.left,
      @required this.height,
      @required this.iconData,
      @required this.onPressedFabIcon,
      this.internet});
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    final card = Container(
      height: height, //350.0
      width: width, //250.0
      margin: EdgeInsets.only(left: left),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: internet
                ? CachedNetworkImageProvider(pathImage)
                : AssetImage(pathImage),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );

    return Stack(
      alignment: Alignment(0.9, 1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(
          iconData: iconData,
          onPressed: onPressedFabIcon,
        )
      ],
    );
  }
}
