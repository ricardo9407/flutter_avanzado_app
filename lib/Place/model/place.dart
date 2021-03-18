import 'package:flutter/cupertino.dart';

class Place {
  String id;
  final String name;
  final String description;
  final String urlImage;
  int likes;
  bool liked;

  Place(
      {Key key,
      @required this.name,
      @required this.description,
      @required this.urlImage,
      this.likes,
      this.liked,
      this.id});
}
