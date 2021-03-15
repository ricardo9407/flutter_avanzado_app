import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/Place/ui/widget/card_image.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/User/ui/widget/profile_place.dart';

class CloudFirestoreAPI {
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);
    return await ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);
    auth.User user = _auth.currentUser;
    DocumentReference _userRef = _db.collection(this.USERS).doc(user.uid);
    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _userRef,
      'urlImage': place.urlImage
    }).then((DocumentReference documentReference) {
      documentReference.get().then((DocumentSnapshot snapshot) {
        DocumentReference refUser = _db.collection(USERS).doc(user.uid);
        refUser.update({
          'myPlaces': FieldValue.arrayUnion([_db.doc("$PLACES/${snapshot.id}")])
        });
      }).catchError((onError) {
        print(
            // ignore: unnecessary_brace_in_string_interps
            "=====Error al generar la referencia===== ${onError}");
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesSnapshot) {
    List<ProfilePlace> profilePlaces = [];
    placesSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(Place(
          name: p.data()['name'],
          description: p.data()['description'],
          urlImage: p.data()['urlImage'],
          likes: p.data()['likes'])));
    });
    return profilePlaces;
  }

  List<CardImageWithFabIcon> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot) {
    List<CardImageWithFabIcon> placesCard = [];
    double width = 300.0;
    double height = 250.0;
    double left = 20.0;
    IconData iconData = Icons.favorite_border;
    placesListSnapshot.forEach((p) {
      placesCard.add(CardImageWithFabIcon(
          pathImage: p.data()["urlImage"],
          width: width,
          left: left,
          height: height,
          iconData: iconData,
          onPressedFabIcon: () {}));
    });
    return placesCard;
  }
}
