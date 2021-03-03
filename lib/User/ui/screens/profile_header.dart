import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/Widget/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../widget/user_info.dart';
import '../widget/button_bar.dart';

// ignore: must_be_immutable
class ProfileHeader extends StatelessWidget {
  UserBloc userBloc;
  User user;
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: userBloc.streamFirebase,
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
          }
        });
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            Text("No se pudo cargar la siguiente información. Haz login")
          ],
        ),
      );
    } else {
      user = User(
          uid: snapshot.data.uid,
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);
      return Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                    child: Container(
                        width: screenWidth,
                        child: TitleHeader(
                            title: "Profile",
                            tamanio: 30.0,
                            padding: EdgeInsets.only(left: 10.0, right: 10.0))))
              ],
            ),
            UserInfo(user),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
