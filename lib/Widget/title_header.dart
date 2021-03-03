import 'package:flutter/material.dart';

class TitleHeader extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  final double tamanio;
  TitleHeader(
      {Key key,
      @required this.title,
      @required this.tamanio,
      @required this.padding});
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Container(
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: tamanio,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
