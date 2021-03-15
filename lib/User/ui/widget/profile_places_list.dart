import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: must_be_immutable
class ProfilePlacesList extends StatelessWidget {
  UserBloc userBloc;
  User user;
  // ignore: invalid_required_positional_param
  ProfilePlacesList(@required this.user);
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
      height: 450.0,
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
      child: ListView(
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
              stream: userBloc.myPlacesListStream(user.uid),
              // ignore: missing_return
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.done:
                    return Column(
                        children: userBloc.buildMyPlaces(snapshot.data.docs));
                  case ConnectionState.active:
                    return Column(
                        children: userBloc.buildMyPlaces(snapshot.data.docs));
                  case ConnectionState.none:
                    return CircularProgressIndicator();
                  default:
                    return Column(
                        children: userBloc.buildMyPlaces(snapshot.data.docs));
                }
              })
        ],
      ),
    );
  }
}
