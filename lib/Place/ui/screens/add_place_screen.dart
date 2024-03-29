import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/Place/ui/widget/card_image.dart';
import 'package:flutter_avanzado_app/Place/ui/widget/title_input_location.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/Widget/button_purple.dart';
import 'package:flutter_avanzado_app/Widget/gradient_back.dart';
import 'package:flutter_avanzado_app/Widget/text_input.dart';
import 'package:flutter_avanzado_app/Widget/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

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
  final _controllerTitlePlace = TextEditingController();
  final _controllerDescriptionPlace = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: <Widget>[
      GradientBack(height: 300.0),
      Row(
          //App Bar
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
                        }))),
            Flexible(
                child: Container(
                    width: screenWidth,
                    child: TitleHeader(
                        title: "Add a new Place",
                        tamanio: 30.0,
                        padding: EdgeInsets.only(
                            top: 45.0, left: 20.0, right: 10.0))))
          ]),
      Container(
          margin: EdgeInsets.only(top: 100.0, bottom: 20.0),
          child: ListView(children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    width: 400.0,
                    height: 250.0,
                    left: 0.1,
                    iconData: Icons.camera_alt,
                    onPressedFabIcon: null,
                    internet: false)),
            Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    maxLine: 1,
                    controller: _controllerTitlePlace)),
            TextInput(
                hintText: "Description",
                inputType: TextInputType.multiline,
                maxLine: 4,
                controller: _controllerDescriptionPlace),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                    controller: null)),
            Container(
                width: 70.0,
                child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () async {
                      userBloc.currentUser().then((User user) {
                        if (user != null) {
                          String userId = user.uid;
                          String path =
                              // ignore: unnecessary_brace_in_string_interps
                              '${userId}/${DateTime.now().toString()}.jpg';
                          userBloc
                              .uploadFile(path, File(widget.image.path))
                              .then((storageUploadTask) {
                            TaskSnapshot snapshot = storageUploadTask;
                            snapshot.ref.getDownloadURL().then((urlImage) {
                              // ignore: unnecessary_brace_in_string_interps
                              print('URLImage: ${urlImage}');
                              userBloc
                                  .updatePlaceData(Place(
                                      name: _controllerTitlePlace.value.text,
                                      description: _controllerDescriptionPlace
                                          .value.text,
                                      likes: 0,
                                      urlImage: urlImage))
                                  .whenComplete(() {
                                print('Added place');
                                Navigator.pop(context);
                              });
                            });
                          });
                        }
                      });
                    }))
          ]))
    ]));
  }
}
