import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/User/model/user.dart';
import 'package:flutter_avanzado_app/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
}
