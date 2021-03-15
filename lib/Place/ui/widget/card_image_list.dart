import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../Place/ui/widget/card_image.dart';

// ignore: must_be_immutable
class CardImageList extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    userBloc = BlocProvider.of<UserBloc>(context);
    return Container(
        height: 350.0,
        child: StreamBuilder(
            stream: userBloc.placesStream,
            // ignore: missing_return
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.none:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
                case ConnectionState.done:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs));
              }
            }));
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: EdgeInsets.only(left: 10.0, bottom: 25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
