import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_avanzado_app/Place/model/place.dart';
import 'package:flutter_avanzado_app/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_avanzado_app/User/model/user.dart' as Model;
import 'package:flutter_avanzado_app/User/repository/cloud_firestore_repository.dart';
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
  User get currentUser => FirebaseAuth.instance.currentUser;

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

  final _firebaseStorageRepository = FirebaseStorageRepository();
  uploadFile(String path, File image) =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
  }
}
