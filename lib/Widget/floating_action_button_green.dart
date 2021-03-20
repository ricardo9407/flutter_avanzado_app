import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  FloatingActionButtonGreen(
      {Key key, @required this.iconData, @required this.onPressed});
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return FloatingActionButton(
        backgroundColor: Color(0xFF11DA53),
        mini: true,
        tooltip: "Fav",
        onPressed: widget.onPressed,
        child: Icon(widget.iconData),
        heroTag: null);
  }
}
