import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

// ignore: must_be_immutable
class ProfilePlacesList extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
        margin:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: userBloc.placesStream,
            // ignore: missing_return
            builder: (context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.done:
                  return Column(
                      children: userBloc.buildPlaces(snapshot.data.docs));
                case ConnectionState.active:
                  return Column(
                      children: userBloc.buildPlaces(snapshot.data.docs));
                case ConnectionState.none:
                  return CircularProgressIndicator();
                default:
                  return Column(
                      children: userBloc.buildPlaces(snapshot.data.docs));
              }
            }));
  }
}
