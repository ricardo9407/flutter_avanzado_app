import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_avanzado_app/User/model/user.dart' as Model;
import 'package:flutter_avanzado_app/User/repository/cloud_firestore_api.dart';
import 'package:flutter_avanzado_app/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_avanzado_app/User/ui/widget/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_avanzado_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  // ignore: non_constant_identifier_names
  final _auth_repository = AuthRepository();
  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  // ignore: missing_return
  Future<User> currentUser() async {
    User user = FirebaseAuth.instance.currentUser;
    return user;
  }

  //Casos de uso
  //1. SingIn a la aplicación Google
  Future<User> signIn() => _auth_repository.signInFirebase();

  //2. SignOut a la aplicación Google
  signOut() => _auth_repository.signOut();

  //3. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Model.User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  //4. Registrar lugar en base de datos
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;
  List<Place> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot, Model.User user) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot, user);
  Future likePlace(Place place, String uid) =>
      _cloudFirestoreRepository.likePlace(place, uid);
  Stream<QuerySnapshot> myPlacesListStream(String uid) =>
      FirebaseFirestore.instance
          .collection(CloudFirestoreAPI().PLACES)
          .where("userOwner",
              isEqualTo: FirebaseFirestore.instance
                  // ignore: unnecessary_brace_in_string_interps
                  .doc("${CloudFirestoreAPI().USERS}/${uid}"))
          .snapshots();
  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesSnapshot) =>
      _cloudFirestoreRepository.buildMyPlaces(placesSnapshot);
  StreamController<Place> placeSelectedStreamController =
      StreamController<Place>();
  Stream<Place> get placeSelectedStream => placeSelectedStreamController.stream;
  StreamSink<Place> get placeSelectedSink => placeSelectedStreamController.sink;

  final _firebaseStorageRepository = FirebaseStorageRepository();
  uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    placeSelectedStreamController.close();
  }
}
