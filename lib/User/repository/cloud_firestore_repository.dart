import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/User/repository/cloud_firestore_api.dart';
import 'package:flutter_avanzado_app/User/ui/widget/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesSnapshot);
}
