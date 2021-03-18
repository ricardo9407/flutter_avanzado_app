import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_avanzado_app/Place/model/place.dart';
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

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = [];
    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p.id,
          name: p.data()["name"],
          description: p.data()["description"],
          urlImage: p.data()["urlImage"],
          likes: p.data()["likes"]);
      List usersLikedRefs = p.data()["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if (user.uid == drUL.id) {
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .doc(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds.data()["likes"];
      _db.collection(PLACES).doc(place.id).update({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            // ignore: unnecessary_brace_in_string_interps
            ? FieldValue.arrayUnion([_db.doc("${USERS}/${uid}")])
            // ignore: unnecessary_brace_in_string_interps
            : FieldValue.arrayRemove([_db.doc("${USERS}/${uid}")])
      });
    });
  }
}
