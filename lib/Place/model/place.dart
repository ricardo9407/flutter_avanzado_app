import 'package:flutter/cupertino.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String urlImage;
  int likes;
  User userOwner;

  Place(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.urlImage,
      this.likes,
      this.userOwner});
}
