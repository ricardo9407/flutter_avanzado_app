import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'profile_header.dart';
import '../widget/profile_places_list.dart';
import '../widget/profile_background.dart';

// ignore: must_be_immutable
class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // ignore: todo
    // TODO: implement build
    return StreamBuilder(
      stream: userBloc.authStatus,
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return showProfileData(snapshot);
          case ConnectionState.done:
            return showProfileData(snapshot);
          default:
            showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      print("No logeado");
      return Stack(children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[Text("Usuario no logeado. Haz login")],
        )
      ]);
    } else {
      print("Logeado");
      var user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);
      return Stack(children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[ProfileHeader(user), ProfilePlacesList(user)],
        )
      ]);
    }
  }
}
