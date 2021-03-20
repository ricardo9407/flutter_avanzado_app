import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/ui/widget/description_place.dart';
import '../widget/review_list.dart';
import 'header_appbar.dart';

// ignore: must_be_immutable
class HomeTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Stack(children: <Widget>[
      ListView(children: <Widget>[DescriptionPlace(), ReviewList()]),
      HeaderAppBar()
    ]);
  }
}
