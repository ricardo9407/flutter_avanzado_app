import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';

// ignore: must_be_immutable
class UserInfo extends StatelessWidget {
  User user;
  // ignore: invalid_required_positional_param
  UserInfo(@required this.user);
  @override
  Widget build(BuildContext context) {
    final userPhoto = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.white, width: 2.0, style: BorderStyle.solid),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(user.photoURL))),
    );

    final userInfo =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Container(
          margin: EdgeInsets.only(bottom: 5.0),
          child: Text(user.name,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Lato'))),
      Text(user.email,
          style: TextStyle(
              fontSize: 15.0, color: Colors.white30, fontFamily: 'Lato'))
    ]);

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
        child: Row(children: <Widget>[userPhoto, userInfo]));
  }
}
