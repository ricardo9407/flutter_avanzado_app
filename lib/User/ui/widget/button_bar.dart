import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/ui/screens/add_place_screen.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/ui/screens/profile_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'circle_button.dart';

// ignore: must_be_immutable
class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Cambiar contraseña
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Añadir nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              // ignore: invalid_use_of_visible_for_testing_member
              ImagePicker.platform
                  .pickImage(source: ImageSource.camera)
                  .then((PickedFile image) {
                if (image != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              AddPlaceScreen(image: File(image.path))));
                } else {
                  ProfileTrips();
                }
              })
                  // ignore: return_of_invalid_type_from_catch_error
                  .catchError((onError) => print(onError));
            }),
            //Cerrar sesión
            CircleButton(true, Icons.exit_to_app, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {userBloc.signOut()}),
          ],
        ));
  }
}
