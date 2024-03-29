import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../Widget/button_purple.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {
  String namePlace;
  int stars;
  String descriptionPlace;
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of(context);
    return StreamBuilder<Place>(
        stream: userBloc.placeSelectedStream,
        builder: (BuildContext context, AsyncSnapshot<Place> snapshot) {
          if (snapshot.hasData) {
            print("PLACE SELECTED: ${snapshot.data.name}");
            Place place = snapshot.data;
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  titleStars(place),
                  descriptionWidget(place.description),
                  ButtonPurple(buttonText: "Navigate", onPressed: () {})
                ]);
          } else {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin:
                          EdgeInsets.only(top: 400.0, left: 20.0, right: 20.0),
                      child: Text("Selecciona un lugar",
                          style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 30.0,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.left))
                ]);
          }
        });
  }

  Widget titleStars(Place place) {
    return Row(children: <Widget>[
      Container(
          margin: EdgeInsets.only(top: 350.0, left: 20.0, right: 20.0),
          child: Text(
            place.name,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
            textAlign: TextAlign.left,
          )),
      Container(
          margin: EdgeInsets.only(top: 370.0),
          child: Text("Hearts: ${place.likes}",
              style: TextStyle(
                  fontFamily: "Lato",
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
              textAlign: TextAlign.left))
    ]);
  }

  Widget descriptionWidget(String descriptionPlace) {
    return Container(
        margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: new Text(descriptionPlace,
            style: const TextStyle(
                fontFamily: "Lato",
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF56575a))));
  }
}
