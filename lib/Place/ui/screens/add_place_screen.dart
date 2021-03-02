import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Widget/gradient_back.dart';

// ignore: must_be_immutable
class AddPlaceScreen extends StatefulWidget {
  File image;
  AddPlaceScreen({Key key, this.image});
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 25.0, left: 5.0),
                  child: SizedBox(
                    height: 45.0,
                    width: 45.0,
                    child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_left,
                            color: Colors.white, size: 45.0),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
