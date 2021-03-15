import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/Widget/title_header.dart';
import '../widget/user_info.dart';
import '../widget/button_bar.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  User user;
  double screenWidth;
  // ignore: invalid_required_positional_param
  ProfileHeader(@required this.user);
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                  child: Container(
                      width: screenWidth,
                      child: TitleHeader(
                          title: "Profile",
                          tamanio: 30.0,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0))))
            ],
          ),
          UserInfo(user),
          ButtonsBar()
        ],
      ),
    );
  }
}
