import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/Widget/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../Widget/gradient_back.dart';
import '../widget/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc;
    userBloc = BlocProvider.of<UserBloc>(context);
    // ignore: todo
    // TODO: implement build
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              return showPlaceData(snapshot);
            case ConnectionState.done:
              return showPlaceData(snapshot);
            default:
              return showPlaceData(snapshot);
          }
        });
  }
}

Widget showPlaceData(AsyncSnapshot snapshot) {
  if (!snapshot.hasData || snapshot.hasError) {
    return Stack(children: <Widget>[
      GradientBack(height: 250.0),
      Text("Usuario no logeado. Haz Login")
    ]);
  } else {
    User user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photoURL: snapshot.data.photoURL);
    return Stack(children: <Widget>[
      GradientBack(height: 250.0),
      TitleHeader(
          title: "Popular",
          tamanio: 30.0,
          padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 10.0)),
      CardImageList(user)
    ]);
  }
}
