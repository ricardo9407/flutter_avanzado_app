import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Widget/gradient_back.dart';
import 'package:flutter_avanzado_app/Widget/button_green.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome \n This is your Travel App",
                  style: TextStyle(
                      fontSize: 37.0,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {},
                width: 300.0,
                height: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
