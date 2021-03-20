import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/User/bloc/bloc_user.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import '../../../Place/ui/widget/card_image.dart';

// ignore: must_be_immutable
class CardImageList extends StatefulWidget {
  User user;
  // ignore: invalid_required_positional_param
  CardImageList(@required this.user);
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {
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
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                case ConnectionState.done:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
                default:
                  return listViewPlaces(
                      userBloc.buildPlaces(snapshot.data.docs, widget.user));
              }
            }));
  }

  Widget listViewPlaces(List<Place> places) {
    void setLiked(Place place) {
      setState(() {
        place.liked = !place.liked;
        userBloc.likePlace(place, widget.user.uid);
        place.likes = place.liked ? place.likes + 1 : place.likes - 1;
        userBloc.placeSelectedSink.add(place);
      });
    }

    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
        padding: EdgeInsets.only(left: 10.0, bottom: 25.0),
        scrollDirection: Axis.horizontal,
        children: places.map((place) {
          return GestureDetector(
              onTap: () {
                print("CLICK PLACE: ${place.name}");
                userBloc.placeSelectedSink.add(place);
              },
              child: CardImageWithFabIcon(
                  pathImage: place.urlImage,
                  width: 350.0,
                  left: 20.0,
                  height: 250.0,
                  iconData: place.liked ? iconDataLiked : iconDataLike,
                  onPressedFabIcon: () {
                    setLiked(place);
                  },
                  internet: true));
        }).toList());
  }
}
