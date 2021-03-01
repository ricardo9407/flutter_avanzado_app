import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';

class CloudFirestoreAPI {
  // ignore: non_constant_identifier_names
  final String USERS = "users";
  // ignore: non_constant_identifier_names
  final String PLACE = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserData(User user) async {
    CollectionReference users = _db.collection(USERS);
    DocumentReference ref = users.doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}
